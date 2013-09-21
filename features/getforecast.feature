Feature: Get Forecast

         Scenario: Get forecast for Moreni decimal coordinates
                   Given the "44.9802778,25.6444444" latitude and longitude coordinates
                   Then get the forecast                   
                   And save forecast if it's rainy
                   
         Scenario: Get forecast for Moreni string address
                   Given the "100 Spear St, San Francisco, CA" address
                   Then get the forecast
                   And save forecast if it's rainy       
