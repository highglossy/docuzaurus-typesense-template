#!/usr/bin/env bash

TYPESENSE_HOST=http://$HOST:$PORT
config=$(cat typesense.config.json | jq ".index_name = \"${PROJECT}\"" | jq ".start_urls = [\"${TYPESENSE_HOST}\"]" | jq ".sitemap_urls = [\"${TYPESENSE_HOST}/sitemap.xml\"]" | jq -r tostring)
echo $config
docker run -it --env-file=./.env -e "CONFIG=$config" typesense/docsearch-scraper:0.9.1
