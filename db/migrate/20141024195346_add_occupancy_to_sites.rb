class AddOccupancyToSites < ActiveRecord::Migration
  def change
    add_column :sites, :occupancy, :integer
  end
end
