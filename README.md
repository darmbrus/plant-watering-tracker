# Plant-Watering Tracker

[![CircleCI](https://circleci.com/gh/darmbrus/plant-watering-tracker/tree/master.svg?style=svg)](https://circleci.com/gh/darmbrus/plant-watering-tracker/tree/master)

Project goals:
* Create a rails back-end for tracking the watering of the plants in my apartment
* Create a python script to read data from an arduino and make calls to the rails server to create records based off of that data
* Create and arduino file to read data from a moisture sensor and send that data through the serial port

Current project status:
* Rails server
  * Functional with users, plants, and waterings
  * Tests developed for controllers, models, routing
* Python script
  * Functional with ability to read serial port, parse incoming data, and post data to rails server
* Arduino
  * Currently configured with physical button to start transfer of data through serial port

Up next:
* Configure arduino to read moisture data
* Develop tests for features
* Integrate factories for testing objects
* Add additional CSS and styling
