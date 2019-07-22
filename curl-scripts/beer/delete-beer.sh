#!/bin/bash

curl "http://localhost:4741/beers/${ID}" \
  --include \
  --header "Authorization: Token token=${TOKEN}" \
  --request DELETE

echo
