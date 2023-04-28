#!/usr/bin/env bash

# Removes all line breaks from a file.
# $1 input
# $2 output
# debian@debian:~$ remove_line_breaks.sh input.txt output.txt

tr '\n' ' ' < $1 > $2
