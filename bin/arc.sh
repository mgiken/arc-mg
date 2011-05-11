#!/bin/sh

export ARCLIB="$(cd $(dirname $(readlink -f $0))/.. && pwd)/lib/"

if [ $# -eq 0 -a "$(type rlwrap)" ]; then
  rl='rlwrap -c -r -q "\"" -b "[]()!:~\"" -C arc'
fi

exec $rl racket -q -f "${ARCLIB}as.scm" $@
