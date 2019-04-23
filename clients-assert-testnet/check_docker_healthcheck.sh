#!/bin/bash
docker inspect --format "{{json .State.Health }}" eco-neo-csharp-node-assert-base-version | jq

docker inspect --format "{{json .State.Health }}" eco-neo-csharp-node-assert-new-version | jq
