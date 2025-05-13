#!/bin/sh

while [ true ]
do
  workspaces="(box :space-evenly false"
  workspaces_json="$(niri msg -j workspaces | jq -c '.[]')"

  num_workspaces=0
  for workspace in $workspaces_json
  do
    if test "$(echo $workspace | jq '.is_active' )" = "true"
    then
      active=$(echo "$workspace" | jq '.idx' )
    fi
    num_workspaces=$((num_workspaces + 1))
  done

  counter=1
  for workspace in $workspaces_json
  do
    if [ $counter -eq $active ]
    then
      class="active_workspace"
    else
      class="workspace"
    fi
    workspaces="$workspaces (label :class \\\"$class\\\" :text $counter)"
    counter=$(($counter + 1))
  done

  workspaces="$workspaces )"

  echo "{\"literal\": \"$workspaces\", \"count\": $num_workspaces, \"active\": $active}"
  sleep "0.05s"
done

