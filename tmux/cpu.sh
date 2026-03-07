#!/bin/bash
# Cross-platform CPU load for tmux status bar
if [[ "$(uname)" == "Darwin" ]]; then
    load=$(sysctl -n vm.loadavg 2>/dev/null | awk '{print $2}')
else
    load=$(awk '{print $1}' /proc/loadavg 2>/dev/null)
fi

[[ -z "$load" ]] && exit 0
echo "$load"
