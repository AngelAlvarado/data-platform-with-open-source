class AlandCounty < ActiveRecord::Migration[5.2]
  def change
  	change_column :counties, :aland, :decimal
    change_column :counties, :awater, :decimal
  end
end
