Feature: Get Forecast

         Scenario: Get forecast for Moreni decimal coordinates
                   Given the "44.9802778,25.6444444" latitude and longitude coordinates
                   When getting the forecast
                   And it's raining                   
                   Then save forecast
                   
         Scenario: Get forecast for Moreni string address
                   Given the "100 Spear St, San Francisco, CA" address
                   When getting the forecast
                   And it's rainy    
                   Then save forecast
