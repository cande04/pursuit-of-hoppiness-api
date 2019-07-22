#!/bin/bash

curl "http://localhost:4741/beers" \
  --include \
  --request GET \
  --header "Authorization: Token token=${TOKEN}"

echo
