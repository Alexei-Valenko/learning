class Event < ApplicationRecord
    belongs_to :trainer
    has_and_belongs_to_many :trainees, join_table: 'events_trainees'
end
