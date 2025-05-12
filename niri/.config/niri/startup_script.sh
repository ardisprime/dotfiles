#!/bin/sh

rm log
WIDGET="$HOME/.config/eww/bar/"
eww kill --config $WIDGET
2>&1
eww daemon --config $WIDGET > log
eww open main --config $WIDGET >> log

