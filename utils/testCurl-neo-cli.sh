#!/bin/bash

curl --silent \
  --request POST \
  --url localhost:30333/ \
  --header 'accept: application/json' \
  --header 'content-type: application/json' \
  --data '{
    "jsonrpc": "2.0",
    "method": "invokefunction",
    "params": [
        "ecc6b20d3ccac1ee9ef109af5a7cdb85706b1df9",
        "totalSupply"
    ],
    "id": 3
  }'
