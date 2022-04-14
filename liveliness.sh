#!/bin/bash

IFS=', '

read -r -a repos <<< "$LIVELINESS_REPOS"

for i in "${repos[@]}"
do
  echo "repo $i"
  response=$(curl --head -w '%{http_code}' -s -k -x http://127.0.0.1:3128 "$i")
  if [ "$response" -ne 200 ]; then
    echo "failed curl for repo $i"
    exit 1
  fi
done