class CreateAtms < ActiveRecord::Migration[5.0]
  def change
    create_table :atms do |t|
      t.string :address

      t.timestamps null: false
    end
  end
end
