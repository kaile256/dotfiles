#!/usr/bin/env bash
# Repo: https://github.com/irondoge/bash-wakatime

set -Ceu

# wakatime for bash
#
# include this file in your "~/.bashrc" file with this command:
#   . path/to/bash-wakatime.sh
#
# or this command:
#   source path/to/bash-wakatime.sh
#
# Don't forget to create and configure your "~/.wakatime.cfg" file.

# hook function to send wakatime a tick
pre_prompt_command() {
    version="1.0.0"
    entity=$(fc -ln -0 | cut -d ' ' -f1)
    [ -z "$entity" ] && return # $entity is empty or only whitespace

    local project
    if git rev-parse --is-inside-work-tree 2> /dev/null; then
        project=$(basename "$(git rev-parse --show-toplevel)")
    else
        project="Terminal"
    fi

    wakatime \
        --write \
        --plugin "bash-wakatime/$version" \
        --entity-type app \
        --project "$project" \
        --entity "$entity" \
        > /dev/null 2>&1 &
    }

PROMPT_COMMAND="pre_prompt_command; ${PROMPT_COMMAND:-}"

# vim:sw=4
