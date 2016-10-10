class CreateWaterings < ActiveRecord::Migration[5.0]
  def change
    create_table :waterings do |t|
      t.integer :amount
      t.date :date
      t.belongs_to :plant
      t.belongs_to :user

      t.timestamps(null: false)
    end
  end
end
