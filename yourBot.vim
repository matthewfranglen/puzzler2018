#!/usr/bin/env bash
# Bot implementation in vim
# vim: set syntax=off :
exec vim -n -u DEFAULTS -i NONE --cmd 'set loadplugins' -c 'normal gg}jy$@"' "${0}"

jyGGop:.,$ s/\v^\@(.).*/j0f:w"\1y$/{j:.,$ jkddy$dd{j@0@a@w
@a initialize      : :enew!:file state:setlocal buftype=nofile
@e get state       : @f@g
@f load raw state  : :1,$ d:read http://localhost:5000/simulator/state:1 d
@g clean state     : :s/^\v(.*)\[(.*)\],.*$/\2gg:s/},{/}\r{/g:% sortgg0fxlllyt,:2,$ normal fx"gg0/"y"/llllyt}:2,$ normal /"y"/":g/"ownerId":[1-9][0-9]*,/ d
@k choose target   : ggyGO@z:2,$ v/collectible/ d:2,$ s/.*"ownerId"/"ownerId":2,$ sort n:1 s/^@[xyz]\ze\v((.|\n)*"ownerId":null,)/@y/e:1 s/^@[xyz]\ze\v((\n|.)*"ownerId":0,){5}/@x/e:1 s/^@z\ze\v((\n|.)*"ownerId":0,)/@x/e:1 s/\v^(\@[xyz])\n(.|\n)*/\1/egg"0pggdd@"
@l only bot base   : :v/"bot_base"/ d
@m sort by distance: :2,$ s/\v^.*"x":-?(\d+),"y":-?(\d+)/\1+\2 &:2,$ normal 0cW=":2,$ sort n
@n only collectible: :v/"ownerId":null/ d:v/collectible/ d:1 s/\n\v(.|\n)*//e
@r submit seek     : @s@t
@s entity direction: :s/\v.*\{"x":(-?\d+).*,"y":(-?\d+).*/\1 \2:s/^-.*/left/e:s/^0 -.*/up/e:s/^0 .*/down/e:s/^\d.*/right/e
@t submit direction: :s/\v^(.+)$/{"entityIdsToAction":[{"id":0,"action":"\1"}]} :s/{/%7B/ge :s/"/%22/ge :s/:/%3A/ge :s/\[/%5B/ge :s/,/%2C/ge :s/}/%7D/ge :s/]/%5D/ge :s/%/\\%/geIhttp://localhost:5000/simulator/tick?json=0y$dd:read 0:1 d
@w loop            : @e@k
@x move to bot base: @l@r@w
@y collect         : @m@n@r@w
@z new round       : :1,$ d:read http://localhost:5000/simulator/new:1 d
