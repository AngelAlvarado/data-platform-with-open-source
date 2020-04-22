class Population < ActiveRecord::Migration[5.2]
  def change
    create_table :populations do |t|
		t.string :county_name
		t.string :state_name
		t.integer :state_fips
		t.string  :county_fips_s
		t.integer :county_fips
		t.integer :population
	end
  end
end
