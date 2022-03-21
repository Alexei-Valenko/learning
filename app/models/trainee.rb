class Trainee < ApplicationRecord
  belongs_to :trainer
  has_many :trainee_events
  has_many :events, through: :trainee_events
  # has_and_belongs_to_many :events, join_table: 'events_trainees'
end
