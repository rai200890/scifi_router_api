
# wifi_uff_location_api

[![Code Climate](https://codeclimate.com/github/rai200890/wifi_uff_location_api/badges/gpa.svg)](https://codeclimate.com/github/rai200890/wifi_uff_location_api)
[![Dependency Status](https://gemnasium.com/rai200890/wifi_uff_location_api.svg)](https://gemnasium.com/rai200890/wifi_uff_location_api)
[![Build Status](https://travis-ci.org/rai200890/wifi_uff_location_api.svg?branch=master)](https://travis-ci.org/rai200890/wifi_uff_location_api)
[![Test Coverage](https://codeclimate.com/github/rai200890/wifi_uff_location_api/badges/coverage.svg)](https://codeclimate.com/github/rai200890/wifi_uff_location_api/coverage)

This project aims helping SCIFI-UFF study group locating EDUROAM's routers inside university's buildings.
This application makes SNMP requests to these devices to discover in which channel and power they are operating on.
Hopefully, this data will be useful for helping configuring routers better, since devices close to one another,
operating at the same channel are more succeptible to interference.  

This is a Rails API to be used by the [interface](https://github.com/rai200890/wifi_uff_location_interface).

##Instalation

### External dependencies

``
sudo apt-get install imagemagick
``

### Project's dependencies

``
bundle install
``

### Creating database

``
rake db:create
rake db:migrate
``

### Loading database seed from spreadsheet

``
thor aps:update <file>
``
