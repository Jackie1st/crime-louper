class CreateLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :locations do |t|
      t.string :title
      t.string :address
      t.string :city
      t.string :state
      
      t.timestamps
    end
  end
end
