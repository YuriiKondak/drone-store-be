class CreateDrones < ActiveRecord::Migration[5.2]
  def change
    create_table :drones do |t|
      t.string :name
      t.integer :price
      t.string :type
      t.integer :top_speed
      t.string :release_date

      t.timestamps
    end
  end
end
