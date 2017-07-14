require 'nokogiri'
require 'open-uri'

namespace :parse_cinema do
  desc "Parse today's movie schedule from www.mori-cinema.ru in Syktyvkar \
        and fill it in database"
  task :mori_today => :environment do
    url = "https://mori-cinema.ru/cinema_detail/4768_mori_sinema/schedule.php"
    doc = Nokogiri::HTML(open(url))
    MoriCinemaToday.destroy_all
    doc.encoding = 'utf-8' # Названия фильмов на русском языке :(
    schedule = doc.at_css('table tbody') # Переход к расписанию
    schedule.css("tr.first").remove # Убрать «Фильм -	Форматы	- Сеансы»
    #File.open('/tmp/mori-cinema.html', 'w') {|f| f.write schedule }
    schedule.search('tr td').each{|f|
      f = f.text.strip.gsub(/\t/, '').gsub(/[\r\n]/, ' ') #двойной gsub?!?
      unless (f[0] =~ /\d/).present?
        MoriCinemaToday.create!({
          title: "#{f}"
          })
      end
    }
  end
end
#MoriCinemaToday.create!({
#    title: "#{movie_title}",
#    two_d: "#{two_d_times}",
#      three_d: "#{three_d_times}"
#    })
