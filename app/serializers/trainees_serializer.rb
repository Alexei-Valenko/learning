class TraineesSerializer < ActiveModel::Serializer
    attributes :id, :name, :trainer_id, :last_event
    
    def last_event
      object.events.last
    end    
end
  