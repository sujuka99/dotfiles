#!/usr/bin/env bash
set -x
# Terminate already running bar instances
# If all your bars have ipc enabled, you can use 
polybar-msg cmd quit
# Otherwise you can use the nuclear option:
# killall -q polybar

# Launch bar1 and bar2
echo "---" | tee -a /tmp/polybar1.log /tmp/polybar2.log
# polybar bottom 2>&1 | tee -a /tmp/polybar1.log & disown

for m in $(polybar --list-monitors | grep "primary" | cut -d":" -f1); do
    MONITOR=$m polybar --reload primary &
done
for m in $(polybar --list-monitors | grep -v "primary" | cut -d":" -f1); do
    MONITOR=$m polybar --reload secondary &
done


echo "Bars launched..."
