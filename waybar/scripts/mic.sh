#!/bin/bash

if [ "$1" == "toggle" ]; then
  # Toggle run toggle script
  "$HOME"/.config/waybar/scripts/mute_script.sh
fi

# Set the preset file
PRESET_FILE="$HOME/.mic_preset"

CURRENT_PRESET=$([ -e "$PRESET_FILE" ] && cat "$PRESET_FILE" || echo "mic")

echo '{
    "text": "'"$([ "$CURRENT_PRESET" == "mic" ] && echo "ON AIR" || echo "MUTED")"'", 
    "alt": "'"$CURRENT_PRESET"'", 
    "percentage": "'"$PERCENT"'", 
    "tooltip": "Click to '"$([ "$CURRENT_PRESET" == "mic" ] && echo "mute" || echo "unmute")"'", 
    "class": "'"$CURRENT_PRESET"'"
}' | jq --unbuffered --compact-output
