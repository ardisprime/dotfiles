#!/bin/sh

# workspaces="(box :halign \"start\""
workspaces="(box :space-evenly false "

counter=1
while test $counter -le 9
do
  workspaces="$workspaces (label :class \"\${workspaces_poll.count < $counter ? 'inactive_workspace' : workspaces_poll.active == $counter ? 'active_workspace' : 'workspace'}\" :text $counter)"
  counter=$(($counter + 1))
done

workspaces="$workspaces )"

echo "$workspaces"

