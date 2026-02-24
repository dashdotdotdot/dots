#!/bin/bash

CONFIG_DIR="$HOME/.config/sketchybar"
. "$CONFIG_DIR/globals.sh"

sb_separator() {
	sepName="sep$RANDOM"
	sketchybar \
		--add item "$sepName" "$1" \
		--set "$sepName" \
		\
		label="───────" \
		padding_left="$2" \
		padding_right="$3" \
		icon.drawing=off \
		label.font.size=9.0 \
		label.color="$OX_DIM"
}
sb_clock() {
  sketchybar --add item clock "$1" \
    --set clock \
      update_freq=10 \
      icon.drawing=off \
      label.font.size=14 \
      label.color="$OX_FG" \
      script='sketchybar --set $NAME label="$(date "+%H:%M")"'
}
sb_pomodoro() {
	sketchybar \
		--add item pomodoro "$1" \
		--set pomodoro \
		\
		update_freq=1 \
		label.font.size=14.0 \
		label.highlight_color="$OX_ORG" \
		label.highlight=off \
		icon= \
		icon.drawing=off \
		updates="when_shown" \
		drawing=off \
		script="$PLUGIN_DIR/pomodoro.sh"
}
sb_date() {
  # Day of week (e.g., Mon)
  sketchybar --add item day "$1" \
    --set day \
      update_freq=120 \
      icon.drawing=off \
      label.font.size=12 \
      label.color="$OX_DIM" \
      script='sketchybar --set $NAME label="$(date "+%a")"'

  # Day number (e.g., 01)
  sketchybar --add item date "$1" \
    --set date \
      update_freq=120 \
      icon.drawing=off \
      label.font.size=16 \
      label.font.style="Regular" \
      label.color="$OX_FG" \
      script='sketchybar --set $NAME label="$(date "+%d")"'

  # Month (e.g., Feb)
  sketchybar --add item month "$1" \
    --set month \
      update_freq=120 \
      icon.drawing=off \
      label.font.size=12 \
      label.color="$OX_DIM" \
      script='sketchybar --set $NAME label="$(date "+%b")"'
}
sb_spaces() {
  for i in "${!SPACE_ICONS[@]}"; do
    sid=$((i + 1))

    sketchybar \
      --add item space.$sid "$1" \
      --subscribe space.$sid aerospace_workspace_change \
      --set space.$sid \
      icon="${SPACE_ICONS[i]}" \
      icon.font.size=14 \
      icon.color="$OX_DIM" \
      background.drawing=off \
      label.drawing=off \
      click_script="aerospace workspace $sid" \
      script="
        FOCUSED=\$(aerospace list-workspaces --focused)
        if [ \"$sid\" = \"\$FOCUSED\" ]; then
          sketchybar --set \$NAME icon.color=$OX_FG
        else
          sketchybar --set \$NAME icon.color=$OX_DIM
        fi
      "
  done
}
sb_bluetooth_headset() {
  sketchybar --add item headphones "$1" \
    --set headphones \
      update_freq=5 \
      icon="􀟥" \
      icon.font="SF Pro:Bold:16.0" \
      icon.color="$OX_DIM" \
      icon.y_offset=-2 \
      icon.padding_left=10 \
      icon.padding_right=10 \
      label.drawing=off \
      drawing=on \
      script='
        # Check if any Bluetooth Audio device is connected via System Profiler
        # This is the most compatible way for AirPods + Bose
        IS_HEADSET=$(system_profiler SPAudioDataType 2>/dev/null | grep -E "Bluetooth|AirPods|Bose|Headphone")

        if [ -n "$IS_HEADSET" ]; then
          # Found them: Make it Bright White
          sketchybar --set $NAME icon.color="0xff333333"
        else
          # Not found: Make it Dark Grey (but keep it visible so it doesnt "blink")
          sketchybar --set $NAME icon.color="0xffAAAAAA"
        fi
      '
}
sb_wifi() {
	sketchybar \
		--add item wifi "$1" \
		--subscribe wifi wifi_change \
		--set wifi \
		icon=􀙇 \
		label.color="$OX_DIM" \
		label.drawing=on \
		script='SSID=$(networksetup -getairportnetwork en0 2>/dev/null | awk -F": " "{print \$2}"); if [ -z "$SSID" ]; then echo "Disconnected"; else echo "$SSID"; fi'
}
sb_battery() {
  sketchybar \
    --add item battery "$1" \
    --subscribe battery system_woke power_source_change \
    --set battery \
    update_freq=60 \
    icon.font="SF Pro:Regular:14" \
    label.color="$OX_DIM" \
    padding_left=-5 \
    script='
      # Get percentage and strip the % sign
      BATT=$(pmset -g batt | grep -Eo "[0-9]+%" | sed "s/%//")
      CHARGING=$(pmset -g batt | grep "AC Power")

      # Determine the icon based on battery level
      # (Using SF Symbols: 􀛨 is full, 􀺶 is charging)
      if [ -n "$CHARGING" ]; then
        ICON="󱘖"
      elif [ "$BATT" -gt 80 ]; then
        ICON="􀛨"
      elif [ "$BATT" -gt 50 ]; then
        ICON="􀺸"
      elif [ "$BATT" -gt 20 ]; then
        ICON="􀺶"
      else
        ICON="􀛩"
      fi

      sketchybar --set $NAME icon="$ICON" label="$BATT"
    '
}

sb_volume() {
	sketchybar \
		--add item volume "$1" \
		--subscribe volume volume_change \
		--set volume \
		\
		script="$PLUGIN_DIR/volume.sh" \
		label.color=$OX_DIM
}
