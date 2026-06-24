#!/usr/bin/env bash
qe() { [ $1 ] && qw $@ || qw $(tail -n1 $HISTFILE|col -xb|sed -e "s/^[\ \t]*//g"); };
qe
