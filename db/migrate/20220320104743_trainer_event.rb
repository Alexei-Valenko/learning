class TrainerEvent < ActiveRecord::Migration[5.2]
  def change
    add_reference :events
  end
end
