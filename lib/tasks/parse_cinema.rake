require 'nokogiri'
require 'open-uri'

namespace :parse_cinema do
  desc 'Parse today schedule from Mori Cinema in Syktyvkar & fill it in db'
  task :mori_today => :environment do
    url = 'https://mori-cinema.ru/cinema_detail/4768_mori_sinema/schedule.php'
    doc = Nokogiri::HTML(open(url))
    doc.encoding = 'utf-8'
    database = MoriCinemaToday
    database.destroy_all

    twod, threed = nil, nil
    times3d, times2d = '', ''
    movie_title = nil

    schedule = doc.css('table.tbl_timetable')[0].css('tr td').children # 0 = today but im actually not sure now
    # File.open('/tmp/parsed_schedule', 'w') {|f| f.write schedule } # see what you got
    schedule.each do |parsed_string|
      next if parsed_string.blank?
      parsed_string = parsed_string.text.to_s
      # TODO: rewrite into defs
      if parsed_string == '3D'
        threed = true
        next
      end
      if parsed_string == '2D'
        twod = true
        next
      end
      if parsed_string =~ /^[0-2]\d{1}:[0-5]\d{1}$/ # 00:00 - 23:59
        # TODO: rewrite into defs
        if twod == true
          times2d = "#{times2d}#{parsed_string} "
          next
        end
        if threed == true
          times3d = "#{times3d}#{parsed_string} "
          next
        end
      end
      unless movie_title.nil?
        fill_database(database, movie_title, times2d, times3d)
        clean_movie_sessions(twod, threed, times3d, times2d)
        movie_title = parsed_string
      else
        movie_title = parsed_string
      end
    end
    fill_database(database, movie_title, times2d, times3d)
  end
end


def fill_database (db, title, times2d, times3d)
  puts "Добавление фильма #{title} в БД."
  db.create!({
    title: "#{title}",
    two_d: "#{times2d}",
    three_d: "#{times3d}"
  })
end

def clean_movie_sessions(twod, sthreed, times3d, times2d)
  twod = nil
  threed = nil
  times3d = ''
  times2d = ''
end
