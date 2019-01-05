#!/usr/bin/env bash
# Bot implementation in vim
# vim: set syntax=off :
exec vim -n -u DEFAULTS -i NONE --cmd 'set loadplugins' -c 'normal gg}jy$@"' "${0}"

jyGGop:.,$ s/\v^\@(.).*/j0f:w"\1y$/{j:.,$ jkddy$dd{j@0@a@x
@a initialize      : :enew!:file state:setlocal buftype=nofile
@e get state       : @f@g
@f load raw state  : :1,$ d:read http://localhost:5000/simulator/state:1 d
@g clean state     : :s/^\v(.*)\[(.*)\],(.*)$/\2\r\r\3gg:s/},{/}\r{/g:1,/^$/-1 sortgg0fxlllyt,:2,/^$/-1 normal fx"gg0/"y"/llllyt}:2,/^$/-1 normal /"y"/"
@k seek collectible: @m@n
@l only bot base   : :v/"bot_base"/ d
@m sort by distance: :2,/^$/-1 s/\v^.*"x":-?(\d+),"y":-?(\d+)/\1+\2 &:2,/^$/-1 normal 0cW=":2,/^$/-1 sort n
@n only collectible: :v/"ownerId":null/ d:v/collectible/ d
@r submit seek     : @s@t
@s entity direction: :s/\v.*\{"x":(-?\d+).*,"y":(-?\d+).*/\1 \2:s/-.*/left/e:s/0 -.*/down/e:s/0 .*/up/e:s/\d.*/right/e
@t submit direction: :s/\v^(.+)$/{"entityIdsToAction":[{"id":0,"action":"\1"}]} :s/{/%7B/ge :s/"/%22/ge :s/:/%3A/ge :s/\[/%5B/ge :s/,/%2C/ge :s/}/%7D/ge :s/]/%5D/ge :s/%/\\%/geIhttp://localhost:5000/simulator/tick?json=0y$dd:read 0:1 d
@x one loop        : @e@l@r
