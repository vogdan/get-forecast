Feature: Get Forecast

         Scenario: Get forecast for Moreni
                   Given the "44.9802778,25.6444444" latitude and longitude coordinates
                   Then get the forecast                   
                   And save forecast if it's rainy
