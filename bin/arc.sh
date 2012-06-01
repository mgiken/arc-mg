#!/bin/sh

export ARCVER="0"
export PREFIX="$(cd $(dirname $(readlink -f $0))/.. && pwd)"
export ARCLIB="$PREFIX/lib"
export LD_LIBRARY_PATH="$ARCLIB/site:$ARCLIB/load:$LD_LIBRARY_PATH"

if [ "$1" = "--show-prefix" ]; then
  echo $PREFIX
  exit 0
fi

if [ $# -eq 0 -a "$(type rlwrap)" ]; then
  rl='rlwrap -c -r -q "\"" -b "[]()!:~\"" -C arc'
fi

exec $rl racket -q -f "${ARCLIB}/as.scm" $@
