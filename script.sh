#!/usr/bin/env sh
#
# Copyright (c) 2021 Oracle and/or its affiliates.
#

NUM_COMMITS=`curl -s \
  -H "Accept: application/vnd.github.v3+json" \
  ${INPUT_URL} \
  | jq .commits`

echo "There are ${NUM_COMMITS} commits."

echo "::set-output name=num_commits::${NUM_COMMITS}"
echo "::set-output name=fetch_depth::${NUM_COMMITS+1}"