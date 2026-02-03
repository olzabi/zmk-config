#!/bin/bash

set -euo pipefail

west build -s zmk/app -b nice_nano_v2 -d build/left -p -- \
  -DSHIELD=corne_left \
  -DZMK_CONFIG="$(pwd)/config" \
  -DDTC="$(which dtc)"

cp build/left/zephyr/zmk.uf2 /mnt/d/firmware/left.uf2


west build -s zmk/app -b nice_nano_v2 -d build/right -p -- \
  -DSHIELD=corne_right \
  -DZMK_CONFIG="$(pwd)/config" \
  -DDTC="$(which dtc)"

cp build/right/zephyr/zmk.uf2 /mnt/d/firmware/right.uf2
