class CreateSites < ActiveRecord::Migration
  def change
    create_table :sites do |t|
      t.text :description
      t.decimal :lat
      t.decimal :lon
      t.string :city
      t.string :state
      t.integer :cost
      t.string :url
      t.integer :lead_time
      t.string :style
      t.string :amenities

      t.timestamps
    end
  end
end
