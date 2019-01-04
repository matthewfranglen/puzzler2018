#!/usr/bin/env bash
# Bot implementation in vim
# vim: set syntax=off :
exec vim -n -u DEFAULTS --cmd 'set loadplugins' -c 'normal gg}jy$@"' "${0}"

j0f:l"ay$ j0f:l"by$ j0f:l"cy$ j0f:l"dy$ j0f:l"ey$ @a@b@c@d@e
load raw state  : :silent edit http://localhost:5000/simulator/state:0file:file state
clean state     : :s/^\v(.*)\[(.*)\],(.*)$/\2\r\r\3gg:s/},{/}\r{/g:1,/^$/-1 sortgg0fxlllyt,:2,/^$/-1 normal fx"gg0/"y"/llllyt}:2,/^$/-1 normal /"y"/"
sort by disance : :2,/^$/-1 s/\v^.*"x":-?(\d+),"y":-?(\d+)/\1+\2 &:2,/^$/-1 normal 0cW=":2,/^$/-1 sort n
best collectible: :1,/^$/-1 v/"ownerId":null/d:2,/^$/-1 v/collectible/d:2,/^$/-1 s/\v.*\{"x":(-?\d+).*,"y":(-?\d+).*/\1 \2:2 s/-.*/left/e:2 s/0 -/
tbc: ihello world
