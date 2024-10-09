#!/usr/bin/env bash

docker run -it --env-file=./.env -e "CONFIG=$(cat typesense.config.json | jq -r tostring)" typesense/docsearch-scraper:0.9.1
