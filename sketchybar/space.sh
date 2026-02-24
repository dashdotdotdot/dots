#!/bin/bash

# Load your colors (OX_FG, OX_DIM)
. "$HOME/.config/sketchybar/globals.sh"

# $NAME is passed by sketchybar as "space.1", "space.2", etc.
# We strip "space." to get just the ID
SID="${NAME#space.}"

# Get the focused workspace
FOCUSED_WORKSPACE=$(aerospace list-workspaces --focused)

# Update the icon color based on the match
if [ "$SID" = "$FOCUSED_WORKSPACE" ]; then
  sketchybar --set "$NAME" icon.color="$OX_FG"
else
  sketchybar --set "$NAME" icon.color="$OX_DIM"
fi
