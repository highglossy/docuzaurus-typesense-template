#!/usr/bin/env sh

config=$(cat typesense.config.json | jq ".index_name = \"${PROJECT}\"" | jq ".start_urls = [\"${PROJECT_URL}/docs\"]" | jq ".sitemap_urls = [\"${PROJECT_URL}/docs/sitemap.xml\"]" | jq -r tostring)
echo $config
docker run --env-file=./.env -e "CONFIG=$config" typesense/docsearch-scraper:0.9.1
