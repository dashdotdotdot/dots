#!/bin/bash

export PLUGIN_DIR="$HOME/.config/sketchybar/plugins"
export OX_BG="0x66FFFFFF"    # main bar background (lightened)
export OX_FG="0xff000000"     # dark foreground color
export OX_DIM="0xff444444"    # darker gray for dimmed appearance
export OX_MG="0xff000000"     # maintained as black for contrast
export OX_ORG="0xffc04040"    # more saturated red for better visibility
export SPACE_ICONS=("􀨁" "􀊴" "􀌃" "􀟆" "􀢅" "􀰬")

export SB_BAR=(
  position=left
  height=60
  sticky=on
  topmost=on
  shadow=on

  y_offset=45
  margin=10
  padding_left=16
  padding_right=16

  color="$OX_BG"
  blur_radius=30        # 🔥 blur strength
  vibrancy=dark         # macOS material
  corner_radius=10

  border_color="0x44ffffff"
  border_width=1

  font_smoothing=on
)
export SB_DEFAULT=(
  icon.font.family="SFMono Nerd Font"
  icon.font.style="Regular"
  icon.font.size=12
  icon.color="$OX_DIM"
  label.font="Source Code Pro"
  label.font.style="Regular"
  label.font.size=13
  label.color="$OX_MG"
  padding_left=10
  padding_right=10
  icon.padding_right=4
  icon.highlight_color="$OX_MG"
)
