require "rubygems"
require 'forecast_io'

ForecastIO.configure do |configuration|
  configuration.api_key = 'e26ea8c99939d15c0e037b208ca06df3'
end

Given /^the input \"(-?[0-9\.]+),(-?[0-9\.]+)\"$/ do |latitude, longitude|
  @latitude = latitude
  @longitude = longitude
end

When /^getting the forecast$/ do
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

