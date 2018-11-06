class ForecastSerializer < ActiveModel::Serializer
  attributes :city, :state, :country, :daily
end
