#!/bin/bash

set -e

GODOT_EXECUTABLE_PATH="/Applications/Godot_mono_v4.4.app/Contents/MacOS/Godot"
GODOT_PID=""

cleanup() {
    echo "Caught Ctrl+C! Stopping Godot..."
    if [[ -n "$GODOT_PID" ]]; then
        kill -s HUP "$GODOT_PID" 2>/dev/null || true
    fi
    exit 0
}

# Set up signal handlers
trap cleanup INT TERM

while true; do
    echo "Starting Godot..."
    "$GODOT_EXECUTABLE_PATH" --run &
    GODOT_PID=$!

    # Wait for lock file to appear
    while true; do
        fswatch -1 .build.src.lock >/dev/null
        if [[ -f .build.src.lock ]]; then
            echo "Lock file appeared. Stopping Godot..."
            kill -s HUP "$GODOT_PID" 2>/dev/null || true
            break
        fi
    done

    # Wait for lock file to disappear
    while true; do
        fswatch -1 .build.src.lock >/dev/null
        if [[ ! -f .build.src.lock ]]; then
            echo "Lock file disappeared. Restarting Godot..."
            break
        fi
    done
done
