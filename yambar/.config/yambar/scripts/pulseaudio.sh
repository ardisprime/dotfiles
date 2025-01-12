#!/bin/bash

infos_output=$(pactl info)
sink_list_output=""
counter=0
selected_sink=""

# outputs
short_sink_name=""
sink_volume=""
sink_muted=""

for info in $infos_output;
do
  if test $counter -gt 33;
  then
    selected_sink=$info
    break
  fi
  counter=$(( $counter+1 ))
done

counter=0
for name in $(pactl -f json list sinks | jq .[].name);
do
  cleaned_name=${name#\"*}
  cleaned_name=${cleaned_name%\"}
  if test $cleaned_name = $selected_sink;
  then 
    break
  fi
  counter=$(( $counter+1 ))
done

short_sink_name=${selected_sink%%.*}
sink_volume=$(pactl -f json list sinks | jq .[$counter].volume.[].value_percent)
sink_volume=${sink_volume#\"*}
sink_volume=${sink_volume%%\"*}
sink_muted=$(pactl -f json list sinks | jq .[$counter].mute)

echo "sink_name|string|$short_sink_name"
echo "sink_volume|string|$sink_volume"
echo "sink_muted|string|$sink_muted"
echo ""

