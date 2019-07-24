#!/bin/bash

NAME="treehouse"
LOCATION="MA"
RATING=5
REVIEW="the best"

curl "http://localhost:4741/breweries" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=${TOKEN}" \
  --data '{
    "brewery": {
      "name": "'"${NAME}"'",
      "location": "'"${LOCATION}"'",
      "rating": "'"${RATING}"'",
      "review": "'"${REVIEW}"'"
    }
  }'

echo
