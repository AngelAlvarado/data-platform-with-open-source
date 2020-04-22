class PopulationCases < ActiveRecord::Migration[5.2]
  def change
	add_column :covidcases, :county_population, :integer 
  end
end
