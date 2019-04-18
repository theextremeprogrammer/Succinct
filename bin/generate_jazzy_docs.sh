#!/bin/sh
jazzy \
  --clean \
  --author "Derek Lee" \
  --author_url https://github.com/derekleerock \
  --github_url https://github.com/derekleerock/Succinct \
  --xcodebuild-arguments -scheme,Succinct \
  --module Succinct \
  --output docs
