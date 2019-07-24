#!/bin/bash

ID=1
NAME="treehouse so yum"
LOCATION='Mass'
RATING=4
REVIEW='yum'


curl "http://localhost:4741/breweries/${ID}" \
  --include \
  --request PATCH \
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
