class CreateJoinTableEventsTranees < ActiveRecord::Migration[5.2]
  def change
    create_join_table :events, :trainees do |t|
      # t.index [:event_id, :trainee_id]
      # t.index [:trainee_id, :event_id]
    end
  end
end
