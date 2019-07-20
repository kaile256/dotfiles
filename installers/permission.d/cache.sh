#!/usr/bin/env bash

set -Ceu

echo "Modifying permissions..."
sudo chown -R $(whoami):$(whoami) $XDG_CACHE_HOME
sudo chmod -R u+x $XDG_CACHE_HOME
echo "Done! Got Permissions."
