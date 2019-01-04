#!/usr/bin/env bash
# Bot implementation in vim
# vim: set syntax=off :
exec vim -n -u DEFAULTS --cmd 'set loadplugins' -c 'normal gg}jy$@"' "${0}"

:silent edit http://localhost:5000/simulator/state
