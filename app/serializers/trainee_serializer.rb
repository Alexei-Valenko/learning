class TraineeSerializer < ActiveModel::Serializer
  attributes :id, :name, :trainer_id, :last_event
  has_many :events 
  
  def last_event
    object.events.last
  end
  
end
