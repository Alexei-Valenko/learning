class TraineeSerializer < ActiveModel::Serializer
  attributes :id :date
  has_many :events 
  embed :true
end
