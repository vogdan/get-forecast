Feature: Get Forecast

         Scenario: Get forecast for Moreni
                   Given the location "44.9802778,25.6444444"
                   When getting the forecast                   
                   Then save forecast if it's rainy
