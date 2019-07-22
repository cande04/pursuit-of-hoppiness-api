#!/bin/bash

NAME="bud light"
STYLE='lager'
ABV='5%'
DESCRIPTION='tastes like water'
BREWERY='Anheuser-Busch'
BREWERY_LOCATION='St. Louis, MO'
RATING=2
REVIEW='yum'

curl "http://localhost:4741/beers" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=${TOKEN}" \
  --data '{
    "beer": {
      "name": "'"${NAME}"'",
      "style": "'"${STYLE}"'",
      "abv": "'"${ABV}"'",
      "description": "'"${DESCRIPTION}"'",
      "brewery": "'"${BREWERY}"'",
      "brewery_location": "'"${BREWERY_LOCATION}"'",
      "rating": "'"${RATING}"'",
      "review": "'"${REVIEW}"'"
    }
  }'

echo
