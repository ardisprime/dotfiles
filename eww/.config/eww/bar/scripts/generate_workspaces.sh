#!/bin/sh

workspaces="(box :space-evenly false"
number_workspaces="$(niri msg -j workspaces | jq -c '.[]')"

counter=1
for workspace in $number_workspaces
do
  workspaces="$workspaces (label :class \"\${workspaces_poll.count < $counter ? 'inactive_workspace' : workspaces_poll.active == $counter ? 'active_workspace' : 'workspace'}\" :text $counter)"
  counter=$(($counter + 1))
done

workspaces="$workspaces )"

echo "$workspaces"

