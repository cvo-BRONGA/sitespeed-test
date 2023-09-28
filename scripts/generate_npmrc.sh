#!/bin/bash

# The entire .npmrc is being generated here to maintain a single source of truth for the artifactory url
# Environment variables are escaped differently because they are evaluated at different stages in our pipeline
rm -f .npmrc
echo "registry = ${ARTIFACTORY_BASE_URL}/api/npm/npm-repos/" > .npmrc
echo "//gapinc.jfrog.io/gapinc/api/npm/npm-repos/:_auth = \${ARTIFACTORY_TOKEN}" >> .npmrc
echo "always-auth = true" >> .npmrc
echo "email = s-fedci-20@gap.service" >> .npmrc
echo "puppeteer_download_host = https://${ARTIFACTORY}@gapinc.jfrog.io/artifactory" >> .npmrc
echo "chromedriver_cdnurl = https://${ARTIFACTORY}@gapinc.jfrog.io/artifactory/chromedriver.storage.googleapis/91.0.4472.101/chromedriver_linux64.zip" >> .npmrc 
echo "legacy-peer-deps=true" >> .npmrc
echo "omit=optional" >> .npmrc