#!/bin/bash
# Cross-platform battery status for tmux status bar
# Outputs full tmux-styled segment, or nothing if no battery
if [[ "$(uname)" == "Darwin" ]]; then
    pct=$(pmset -g batt 2>/dev/null | grep -Eo '\d+%' | head -1 | tr -d '%')
    charging=$(pmset -g batt 2>/dev/null | grep -c 'AC Power')
else
    bat="/sys/class/power_supply/BAT0"
    if [[ -f "$bat/capacity" ]]; then
        pct=$(cat "$bat/capacity")
        charging=$(grep -c 'Charging' "$bat/status" 2>/dev/null)
    fi
fi

[[ -z "$pct" ]] && exit 0

if [[ "$charging" -gt 0 ]]; then
    icon=""
elif [[ "$pct" -ge 75 ]]; then
    icon=""
elif [[ "$pct" -ge 50 ]]; then
    icon=""
elif [[ "$pct" -ge 25 ]]; then
    icon=""
else
    icon=""
fi

echo "#[fg=#5fafaf,bg=#444444]#[fg=#1a1a2e,bg=#5fafaf] $icon $pct%% "
