class Trainer < ApplicationRecord
    has_many :trainee
    has_many :event
end
