#!/usr/bin/env bash

docker run -it --env-file=./.env.typesense -e "CONFIG=$(cat typesense.config.json | jq -r tostring)" typesense/docsearch-scraper:0.9.1
