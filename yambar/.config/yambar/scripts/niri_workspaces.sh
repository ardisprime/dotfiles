#!/bin/bash

set -f 

pre_focused_workspaces=""
focused_workspace=""
post_focused_workspaces=""
state=0 # 0=focused not reached | 1=focused reached | 2=past focused
 
for workspace in $(niri msg workspaces);
do
  # value is not a number
  if ! [[ $workspace =~ ^[0-9]+$ ]];
  then
    # if value is * got to state 1 on next loop because focused workspace was reached
    if [ $workspace = "*" ];
    then
      state=1
    fi
  # value is a number
  else
    case $state in
      0)
        # if first time writing to string dont add extra space
        if test -z $pre_focused_workspaces;
        then
          pre_focused_workspaces="$workspace"
        # already wrote to variable
        else
          pre_focused_workspaces="$pre_focused_workspaces $workspace"
        fi
        ;;
      1)
        focused_workspace=" $workspace "
        state=2
        ;;
      2)
        # if first time writing to string dont add extra space
        if test -z $post_focused_workspaces;
        then
          post_focused_workspaces="$workspace"
        # already wrote to variable
        else
          post_focused_workspaces="$post_focused_workspaces $workspace"
        fi
        ;;
    esac
  fi
done

echo "pre_focused_workspaces|string|$pre_focused_workspaces"
echo "focused_workspace|string|$focused_workspace"
echo "post_focused_workspaces|string|$post_focused_workspaces"
echo ""

set +f 

