#!/usr/bin/env bash

set -Ceu

git fetch --unshallow >/dev/null 2>&1 || true

USER=kaile256

if [ $# == 1 ]; then
  ALIAS=origin
  URL=$1
elif [ $# == 2 ]; then
  ALIAS=$1
  URL=$2
else
  echo "This script requires an argument at least."
  exit
fi

echo "$URL" | grep -e ".\+/.\+" >/dev/null 2>&1 \
  || URL=$USER/$URL
echo "$URL" | grep 'https://github.com/' >/dev/null 2>&1 \
  || URL="https://github.com/$URL"

git remote set-url "$ALIAS" "$URL"
