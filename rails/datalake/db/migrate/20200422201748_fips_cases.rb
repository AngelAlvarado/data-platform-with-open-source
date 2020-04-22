class FipsCases < ActiveRecord::Migration[5.2]
  def change
	add_column :covidcases, :fips_s, :string 
  end
end
