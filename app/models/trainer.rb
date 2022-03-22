class Trainer < ApplicationRecord
    has_many :trainees
    has_many :events
end
