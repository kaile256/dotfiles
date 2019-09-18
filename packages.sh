#!/usr/bin/env bash

source list.sh

# Identify installer {{{
## Identify; list {{{
Installer=(
apt
yay
)

declare -A Source
Source=(
['yay']='yay.sh'
['apt']='apt.sh'
)
#}}}

for i in ${Installer[@]}; do
  type $i >> /dev/null 2>&1 && export INSTALLER="$i"
done

[[ ! -z $INSTALLER ]] && echo "Installer is identified, $INSTALLER!"

export src_sh="${Source[$INSTALLER]}"
echo "Sourcing $src_sh..."
source $src_sh
#}}}
