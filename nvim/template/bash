#!/usr/bin/env bash

# C-option: do not overwrite on redirect; replace '>' with '>|' to surely overwite a file.
# e-option: stop if error (non 0); add '&& true' to continue even when error.
# u-option: stop if an undefined variable is set, or undefined var shall be regarded as null.
#           (e.g., var=foo && rm -fr ~/"$bar" shall remove all of '~')
set -Ceu
