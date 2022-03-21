class Event < ApplicationRecord

    include ActiveModel::Serializers::JSON
    attr_accessor :date

    def attributes
      {'date' => nil}
    end


    belongs_to :trainer
    has_many :trainee_events
    has_many :trainees, through: :trainee_events
end
