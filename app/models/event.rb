class Event < ApplicationRecord
    belongs_to :trainer
    has_many :trainee_events
    has_many :trainees, through: :trainee_events
    # has_and_belongs_to_many :trainees, join_table: 'events_trainees'
end
