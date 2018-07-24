class CreateResults < ActiveRecord::Migration[5.2]
  def change
    create_table :results do |t|
      t.string :area
      t.string :location
      t.string :crime
      t.string :description
      t.string :weapon
      t.string :time

      t.timestamps
    end
  end
end
