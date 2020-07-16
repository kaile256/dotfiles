#!/usr/bin/env bash

set -Ceu

git fetch --unshallow >/dev/null 2>&1 || true

ORIG=$(git config --get remote.origin.url)
ALIAS=origin
USER=kaile256

if [ $# == 0 ]; then
  URL=$(git rev-parse --show-toplevel | sed -e 's;.*/;;')
elif [ $# == 1 ]; then
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

if git config --get remote.origin.url | grep "$URL" >/dev/null 2>&1; then
  echo "\"$ALIAS\" has already set to \"$URL\""
  exit
fi

git remote set-url "$ALIAS" "$URL" \
  && echo -e "Done! \"$ALIAS\" is updated:\n old: \"$ORIG\"\n new: \"$URL\""
