#!/bin/sh

pulseaudio_json="$(pactl -fjson list sinks)"
selected_sink="$(pactl get-default-sink)"

volume=0

for sink in "$(echo $pulseaudio_json | jq -c '.[]' )"
do
  if test "$(echo $sink | jq -c .name)" = "\"$selected_sink\""
  then
    volume="$(echo $sink | jq -c '.volume["front-left"].value_percent')"
    muted="$(echo $sink | jq -c '.mute')"
  fi
done

echo "{\"name\": \"${selected_sink%%.*}\", \"volume\": $volume, \"muted\": $muted}"

