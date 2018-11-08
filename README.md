# WeatherApp - Sunshine


Weather Application using Esri Appstudio
UI/UX Design - Adobe XD
Logos and weather images - flaticon

Buisness Logic :
I have built a weather application using App studio. I have used a real-time weather data using weather API's which will give current weather and forecast of your location.
 <br />

* I have used weather API from OpenWeatherApp - https://openweathermap.org/api
* I Have used two API:
<br />
--> Current weather data and, (Forecast is available in JSON)
<br />
* api.openweathermap.org/data/2.5/weather?lat=35&lon=139
<br />
* sample response - "{"coord":{"lon":139,"lat":35},
"sys":{"country":"JP","sunrise":1369769524,"sunset":1369821049},
"weather":[{"id":804,"main":"clouds","description":"overcast clouds","icon":"04n"}],
"main":{"temp":289.5,"humidity":89,"pressure":1013,"temp_min":287.04,"temp_max":292.04},
"wind":{"speed":7.31,"deg":187.002},
"rain":{"3h":0},
"clouds":{"all":92},
"dt":1369824698,
"id":1851632,
"name":"Shuzenji",
"cod":200}"
<br />
<br />

--> 5 day forecast (Forecast is available in JSON)
<br />
* api.openweathermap.org/data/2.5/forecast?lat={lat}&lon={lon}


* There are the three screen with first being the start page of the application showing the logo and name of the wetaher app with a start button to proceed to the application. 
 <br />

* The second page shows the curent location of the user using location libraries. It also shows the maximum and minimum temperatures.
 <br />
It also shows additonal information like
 <br />
--> Wind
 <br />
--> Humidity
 <br />
--> Visibility
 <br />
 <br />
* On clicking the location buttion beside the current location of the user of the application will redirect it to the third screen which shows the currwnt location of the user on the map.
 
 * Also there the application first loads the components compltetly before rendering the page, due to this there might be a lag of few seconds.
 * When the application finds the current location of the user, there is a slight lag because the application will load the entire map completely before the actual location.  
 
 The UI design of the applictaion 
 <br />
 <br />
 Starting page of the WeatherApp
 <br />
<img width="317" alt="screen shot 2018-10-28 at 10 43 13 pm" src="https://user-images.githubusercontent.com/32825210/47631477-75a60700-db03-11e8-8cce-d018c033af0f.png">

 <br />
 <br />
 Screen shows the weather for current location with additional information
 <br />
<img width="317" alt="screen shot 2018-10-28 at 10 43 25 pm" src="https://user-images.githubusercontent.com/32825210/47631482-79d22480-db03-11e8-8a9d-5c3610f56048.png">

 <br />
 <br />
 Location of the current user
 <br />
<img width="317" alt="screen shot 2018-10-28 at 10 44 16 pm" src="https://user-images.githubusercontent.com/32825210/47631488-7fc80580-db03-11e8-8436-7ce00de86b9c.png">


 <br />
 <br />

My idea to improve the UI design of the application
Starting page of the WeatherApp
<br /> 
<img width="317" alt="screen shot 2018-11-08 at 10 36 43 am" src="https://user-images.githubusercontent.com/32825210/48219821-6e240080-e342-11e8-8e68-a804c3de7751.png">


 <br />
 <br />
 Screen shows the weather for current location with additional information
 <br />
<img width="317" alt="screen shot 2018-11-08 at 10 36 55 am" src="https://user-images.githubusercontent.com/32825210/48219828-72e8b480-e342-11e8-9d1d-e452c26d4cee.png">


 <br />
 <br />
 Location of the current user
 <br />
<img width="317" alt="screen shot 2018-11-08 at 10 37 10 am" src="https://user-images.githubusercontent.com/32825210/48219831-74b27800-e342-11e8-9fa8-d740a50211bd.png">




