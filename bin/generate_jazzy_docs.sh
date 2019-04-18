#!/bin/sh
jazzy \
  --clean \
  --min-acl public \
  --no-hide-documentation-coverage \
  --author "Derek Lee" \
  --author_url https://github.com/derekleerock \
  --github_url https://github.com/derekleerock/Succinct \
  --xcodebuild-arguments -scheme,Succinct \
  --module Succinct \
  --output ./docs \
  --documentation=./*.md
