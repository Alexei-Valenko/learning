class Event < ApplicationRecord
    belongs_to :trainer
    has_many :trainee_events
    has_many :trainees, through: :trainee_events
end
