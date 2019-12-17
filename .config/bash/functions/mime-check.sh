#!/usr/bin/env bash

xdg-mime query filetype "$1" | xargs xdg-mime query default
