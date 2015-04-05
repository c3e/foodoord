#!/bin/sh
set -e

PIPE_PATH=/var/run/foodoord.pipe

if [ ! -e $PIPE_PATH ]
 then
  echo "Pipe missing. Check daemon status."
 exit 1
fi 

case $1 in
  close)
    echo close > $PIPE_PATH
    cowsay "Ich mach jetzt auf"  > /var/run/banner
   ;;
  open)
    echo open > $PIPE_PATH
    cowsay "Ich mach jetzt zu" > /var/run/banner
   ;;
  *)
    echo "Usage: $(basename $0) { close, open}"
    exit 1
   ;;
esac
