class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.integer :date
      t.integer :hour
      t.integer :length

      t.timestamps
    end
  end
end
