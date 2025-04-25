#!/bin/bash

GODOT="/Applications/Godot_mono_v4.4.app/Contents/MacOS/Godot"
LOCK_FILE=".build.assets.lock"
SUCCESS_FILE=".build.assets.success"
FAILED_FILE=".build.assets.failed"

echo "👀 Watching assets/ for changes..."

fswatch -o assets | while read -r change; do
  echo "🔄 Change detected in assets/"
  
  # Mark as in progress
  echo "Building assets..." > "$LOCK_FILE"
  rm -f "$FAILED_FILE"

  # Run the assets build
  if make build-assets; then
    rm -f "$LOCK_FILE"
    date -u > "$SUCCESS_FILE"
    echo "✅ Asset build complete"
  else
    rm -f "$LOCK_FILE"
    date -u > "$FAILED_FILE"
    echo "❌ Asset build failed"
  fi

  # prevent editor file-writes from re-triggering fswatch (doesn't work)
  # sleep 1
done
