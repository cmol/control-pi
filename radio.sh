#!/bin/bash

RADIO="http://playerservices.streamtheworld.com/pls/CBC_R1_EDM_H.pls"

if [[ -z "$(pgrep vlc)" ]]
then
  nohup cvlc $RADIO --control dbus &>/dev/null &
else
  p=$(pgrep vlc)
  DBUS_SESSION_BUS_ADDRESS=$(xargs -n 1 -0 < /proc/$p/environ | sed -n 's/^DBUS_SESSION_BUS_ADDRESS=\(.*\)/\1/p')
  p1=$(qdbus org.mpris.MediaPlayer2.vlc /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Position)
  sleep 30
  p2=$(qdbus org.mpris.MediaPlayer2.vlc /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Position)
  if [[ $p1 -eq $p2 ]]
  then
    pkill vlc
    nohup cvlc $RADIO --control dbus &>/dev/null &
  fi
fi
