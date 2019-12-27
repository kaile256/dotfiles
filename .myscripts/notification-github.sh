#!/bin/sh

set -Cue

TOKEN="$MY_API_TOKEN/github/notification"

notifications=$(curl -fs https://api.github.com/notifications?access_token="$TOKEN "| jq ".[].unread" | grep -c true)

if [ "$notifications" -gt 0 ]; then
    echo "# $notifications"
fi
