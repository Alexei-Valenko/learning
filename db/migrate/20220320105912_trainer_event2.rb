class TrainerEvent2 < ActiveRecord::Migration[5.2]
  def change
    change_table :events do |t|
      add_reference :events, :trainer
    end
  end
end
