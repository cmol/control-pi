#!/bin/bash

RADIO="http://playerservices.streamtheworld.com/pls/CBC_R1_EDM_H.pls"

if [[ -z "$(pgrep vlc)" ]] ;
then
  nohup cvlc $RADIO &>/dev/null &
  #cvlc $RADIO
fi

