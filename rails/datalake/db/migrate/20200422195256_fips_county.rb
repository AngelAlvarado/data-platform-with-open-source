class FipsCounty < ActiveRecord::Migration[5.2]
  def change
    add_column :counties, :fips_s, :string 
  end
end
