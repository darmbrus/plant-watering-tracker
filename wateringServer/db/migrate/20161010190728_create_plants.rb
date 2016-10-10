class CreatePlants < ActiveRecord::Migration[5.0]
  def change
    create_table :plants do |t|
      t.string :name
      t.string :species
      t.integer :days_per_watering
      t.date :start_date

      t.timestamps(null: false)
    end
  end
end
