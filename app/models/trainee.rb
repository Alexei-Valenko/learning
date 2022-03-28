class Trainee < ApplicationRecord
  belongs_to :trainer
  has_many :trainee_events
  has_many :events, through: :trainee_events
end
