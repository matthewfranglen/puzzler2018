#!/usr/bin/env bash
# Bot implementation in vim
# vim: set syntax=off :
exec vim -n -u DEFAULTS -i NONE --cmd 'set loadplugins' -c 'normal gg}jy$@"' "${0}"

j0f:w"ay$ j0f:w"ey$ j0f:w"fy$ j0f:w"gy$ j0f:w"hy$ j0f:w"iy$ j0f:w"xy$ @a@x
@a initialize      : :enew
@e load raw state  : :1,$ d
@f clean state     : :s/^\v(.*)\[(.*)\],(.*)$/\2\r\r\3
@g sort by distance: :2,/^$/-1 s/\v^.*"x":-?(\d+),"y":-?(\d+)/\1+\2 &
@h best collectible: :1,/^$/-1 v/"ownerId":null/d
@i submit direction: :s/\v^(.+)$/{"entityIdsToAction":[{"id":0,"action":"\1"}]}
@x one loop        : @e@f@g@h@i