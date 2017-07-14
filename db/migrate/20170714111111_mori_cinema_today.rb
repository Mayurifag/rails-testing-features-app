class MoriCinemaToday < ActiveRecord::Migration[5.1]
  def change
    create_table :mori_cinema_todays do |t|
      t.string :title
      t.string :two_d
      t.string :three_d

      t.timestamps
    end
  end
end
