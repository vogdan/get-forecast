require 'rubygems'
require 'forecast_io'
require 'geokit'

include GeoKit::Geocoders

ForecastIO.configure do |configuration|
  configuration.api_key = 'e26ea8c99939d15c0e037b208ca06df3'
end

GET_CRD = Transform /^(-?[0-9\.]+)$/ do |coordinate|
  coordinate.to_i
end

GET_CRDS_FROM_ADDRESS = Transform /^([0-9a-zA-Z, ]+)$/ do |address|
  coordinates = MultiGeocoder.geocode(address)
end

Given /^the "(#{GET_CRD}),(#{GET_CRD})" latitude and longitude coordinates$/ do |latitude, longitude|
  @latitude = latitude
  @longitude = longitude
end

Given /^the "(#{GET_CRDS_FROM_ADDRESS})" address$/ do |coordinates|
  @latitude = coordinates.lat
  @longitude = coordinates.lng
#  puts "latitude:" + @latitude
#  puts "longitude" + @longitude
end

Then /^get the forecast$/ do
  @forecast = ForecastIO.forecast(@latitude, @longitude)
  @summary = @forecast.currently.summary
end

And /^save forecast if it\'s rainy$/ do
  if @summary == "Rain" then
    File.open("rainy_forcast.json", 'w') {|f| f.write(@forecast) }
  else
    puts "NO RAIN, MAN!"
  end
end




