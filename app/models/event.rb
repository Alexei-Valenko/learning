require 'time'
class Event < ApplicationRecord
    
    validate :new_date_cannot_be_in_the_past, on: :create

    belongs_to :trainer
    has_many :trainee_events
    has_many :trainees, through: :trainee_events

    def new_date_cannot_be_in_the_past
        errors.add(:date, "can't be in the past") if date.to_time  < Time.now
    end
end
