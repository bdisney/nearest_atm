class CreateLocations < ActiveRecord::Migration[5.0]
  def change
    create_table :locations do |t|
      t.belongs_to :atm, index: true

      t.float :longitude
      t.float :latitude

      t.timestamps null: false
    end
  end
end
