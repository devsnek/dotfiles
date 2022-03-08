#!/usr/bin/bash

dunstctl set-paused true

function cleanup {
  dunstctl set-paused false
}

trap cleanup EXIT

i3lock \
  --nofork \
  -i ~/Pictures/wp5569141-raptors-desktop-4k-3840x2180-wallpapers.png \
  --pass-media-keys \
  --pass-screen-keys
