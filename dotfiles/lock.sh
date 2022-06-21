#!/usr/bin/bash

dunstctl set-paused true

function cleanup {
  dunstctl set-paused false
}

trap cleanup EXIT

i3lock_options="\
  --nofork \
  -i $HOME/Pictures/wp5569141-raptors-desktop-4k-3840x2180-wallpapers.png \
  --pass-media-keys \
  --pass-screen-keys"

if [[ -e /dev/fd/${XSS_SLEEP_LOCK_FD:--1} ]]; then
  kill_i3lock() {
    pkill -xu $EUID "$@" i3lock
  }

  trap kill_i3lock TERM INT

  i3lock $i3lock_options {XSS_SLEEP_LOCK_FD}<&-

  exec {XSS_SLEEP_LOCK_FD}<&-

  while kill_i3lock -0; do
    sleep 0.5
  done
else
  trap 'kill %%' TERM INT
  i3lock -n $i3lock_options &
  wait
fi
