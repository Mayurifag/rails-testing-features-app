namespace :export do
  desc "Prints Movie.all in a seeds.rb way."
  task :seeds_format => :environment do
    puts "ruby encoding: utf-8"
    Movie.order(:id).all.each do |movie|
      puts "Movie.create(#{movie.serializable_hash.delete_if {|key, value| ['created_at','updated_at','id'].include?(key)}.to_s.gsub(/[{}]/,'')})"
    end
  end
end
