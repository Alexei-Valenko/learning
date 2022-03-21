class CreateTrainees < ActiveRecord::Migration[5.2]
  def change
    create_table :trainees do |t|
      t.string :name
      t.references :trainer, foreign_key: true

      t.timestamps
    end
  end
end
