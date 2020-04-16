class CreateCovidcases < ActiveRecord::Migration[5.2]
  def change
    create_table :covidcases do |t|
      t.date :date
      t.decimal :lat
      t.decimal :lon
      t.string :county
      t.string :state
      t.integer :fips
      t.integer :cases
      t.integer :deaths
      t.timestamps
    end
  end
end
