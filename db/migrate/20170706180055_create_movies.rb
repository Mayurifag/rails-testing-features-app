class CreateMovies < ActiveRecord::Migration[5.1]
  def change
    create_table :movies do |t|
      t.string :title
      t.text :slogan
      t.decimal :imdb_rating
      t.float :rating
      t.string :countries
      t.text :budget
      t.text :box_office_ru
      t.date :premiere_world
      t.date :premiere_ru
      t.string :duration
      t.text :description
      t.text :directors
      t.text :producers
      t.text :composers
      t.text :genres

      t.timestamps
    end
  end
end
