class ForecastSerializer < ActiveModel::Serializer
  attributes :city, :state, :country
end
