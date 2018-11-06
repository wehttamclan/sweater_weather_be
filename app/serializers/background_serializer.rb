class BackgroundSerializer < ActiveModel::Serializer
  attributes :image, 
             :city, 
             :state, 
             :country
end
