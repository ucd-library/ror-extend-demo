# UC Davis

This directory shows an example of managing data for UC Davis colleges and
departments.

  + (05rrcem69.jsonld) - Shows the JSON from the ROR API for our
    university, but with the addition of the context statement.

  + (ucdavis.jsonld) - Shows the JSON-LD for the UC Davis structure


In this case, we imagine the maintaince of the local organizations
in a [Google
Sheet](https://docs.google.com/spreadsheets/d/1pvl008jm7T_Ala20y0zJKCv5rNpKl9JklJL0f4o0mHA/edit?usp=sharing)

The spreadsheet allows some simple editing of the University's organizations.
The spreadsheet will then write JSON-LD data.  In addition, in this example,
we've added a simple web application that will allow the data to be downloaded.
The code below shows the command to retrieve the organization data.

``` bash
curl -L  https://script.google.com/macros/s/AKfycbz30O4ZIYpi6job8bP1qEpJYrIVUwGivyEU3GaeWzDs_N-xGL4B/exec
```
