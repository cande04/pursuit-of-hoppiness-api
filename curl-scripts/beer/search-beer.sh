#!/bin/bash

SEARCH="bud_light"

--curl "http://localhost:4741/search-beer" \
--include \
--request GET \
--header "Content-Type: application/json" \
--header "Authorization: Token token=${TOKEN}" \
