#!/bin/sh

niri_json="$(niri msg -j workspaces)"

count=0
for workspace in $(echo $niri_json | jq -c '.[]' )
do
  count=$(($count + 1))
  if test "$(echo "$workspace" | jq '.is_active' )" = "true"
  then
    active=$(echo "$workspace" | jq '.idx' )
  fi
done

echo "{\"count\": $count, \"active\": $active}"

