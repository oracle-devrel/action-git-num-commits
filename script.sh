#!/usr/bin/env sh
#
# Copyright (c) 2021 Oracle and/or its affiliates.
#

NUM_COMMITS=`curl -s \
  -H "Accept: application/vnd.github.v3+json" \
  ${INPUT_URL} \
  | jq .commits`
FETCH_DEPTH=`$NUM_COMMITS+1 | bc`

echo "There are ${NUM_COMMITS} commits."
echo "Fetch depth should be ${FETCH_DEPTH}"

echo "::set-output name=num_commits::${NUM_COMMITS}"
echo "::set-output name=fetch_depth::${FETCH_DEPTH}"