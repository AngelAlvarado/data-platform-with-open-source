class CreateCounties < ActiveRecord::Migration[5.2]
  def change
    create_table :counties do |t|
      t.decimal :latitude, precision: 13, scale: 7
      t.decimal :longitude, precision: 13, scale: 7
      t.string :state
      t.string :name
      t.integer :fips
      t.integer :ansicode
      t.integer :awater
      t.integer :aland
      t.decimal :aland_sqmi
      t.decimal :awater_sqmi
      t.timestamps
    end
  end
end