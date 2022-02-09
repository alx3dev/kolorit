#!/usr/bin/env bash

##
# Inspect source code with rubocop. Do not change .rubocop_todo.yml.
#
# To check your changes in source code, run:
#
#   ./check-syntax.sh
#
# Two errors are hidden by .rubocop_todo.yml. This are not offenses,
# we must include Kolorit at top level, to make it work on all classes.
# To see this errors run:
#
#   ./check-syntax.sh --all
#
##

if [ "$1" == "-a" ] || [ "$1" == "--all" ] || [ "$1" == "--total" ]; then
rubocop --format simple --config .rubocop.yml
else
rubocop --format simple --config .rubocop_todo.yml
fi
