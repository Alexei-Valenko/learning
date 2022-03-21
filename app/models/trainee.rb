class Trainee < ApplicationRecord
  belongs_to :trainer
  has_and_belongs_to_many :events, join_table: 'events_trainees'
end
