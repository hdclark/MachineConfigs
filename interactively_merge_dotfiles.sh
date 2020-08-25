#!/usr/bin/env bash

# This script can be used to merge files in dotfiles/ with the equivalent dotfile in ~/ .
find ./dotfiles/ -type f -print0 |
sed -z -e 's@\(.*dotfiles/\)\(.*\)$@\1\2 ~/\2@' |
  xargs -0 -I '{}' -P 1 -n 1 -r bash -c "
    echo '=== Merging files: {} ==='
    cmp {} &>/dev/null && echo '...files are identical, nothing to do.' ||
      meld {}"

