# Instructions

:eyes: This project was made in macOS :heavy_exclamation_mark:

* Ruby version 3.1.0

Problem: The main goal is to create an endpoint which could return, from a destination that Reservamos offers, the minimum and maximum temperature of the following 7 days.

Solution: An endpoint was created which would consume the APIs of Open Weather and Reservamos in order to have the destinations it offers and from these, obtain the latitude and longitude of the cities and be able to use them to know their temperature.

After clone the repository, we need to set our project:

* Run ```bundle install```

After run bundle install, we need to start the server with

* ```rails s```

When the server is started, we need to use Postman to test the endpoint

* ```http://127.0.0.1:3000/api/v1/destinations?city=```

* :eyes: The number of the port it will depent of which one are you using.

In Postman, we need to put the enpoint with a name of the city we want to know the temperature, it could be the partial or total name of any city in Mexico.

![image](https://user-images.githubusercontent.com/57637591/185801567-f20a09aa-7d6d-4470-951c-0e6be8ffdd02.png)
![image](https://user-images.githubusercontent.com/57637591/185801627-db8fcaee-75a7-4b6a-b8ed-3df678548415.png)

Results by Partial

![image](https://user-images.githubusercontent.com/57637591/185801827-a3aebee2-7e4c-4caa-a296-537835e4dacb.png)

Results by total name

![image](https://user-images.githubusercontent.com/57637591/185801714-72a3baa3-ee5c-471b-bbed-46626c62c803.png)

