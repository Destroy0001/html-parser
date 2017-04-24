# README

This is a basic REST api that parses and stores all h3,h2,h1, and links on a url. 

Endpoints: 
  * `POST /parse` with form param or query param `url` parses the url's html. 
  * `GET /show` returns a json response with all stored urls data


You need install mongoDB, ruby 2.3.*, rails 5.0.2 to start using the application
