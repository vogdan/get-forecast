require "rubygems"
require 'forecast_io'

ForecastIO.configure do |configuration|
  configuration.api_key = 'e26ea8c99939d15c0e037b208ca06df3'
end

GET_CRD = Transform /^(-?[0-9\.]+)$/ do |coordinate|
  coordinate.to_i
end

  Given /^the "(#{GET_CRD}),(#{GET_CRD})" latitude and longitude coordinates$/ do |latitude, longitude|
  @latitude = latitude
  @longitude = longitude
end

When /^get the forecast$/ do
  @forecast = ForecastIO.forecast(@latitude, @longitude)
  @summary = @forecast.currently.summary
end

Then /^save forecast if it\'s rainy$/ do
  if @summary == "Rain" then
    File.open("rainy_forcast.json", 'w') {|f| f.write(@forecast) }
  else
    puts "NO RAIN, MAN!"
  end
end

