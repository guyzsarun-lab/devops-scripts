#!/bin/bash

# Usage: ./curl_loop.sh <url> <interval_in_seconds>
# Example: ./curl_loop.sh https://example.com 5

URL=$1
INTERVAL=${2:-5}  # default to 5 seconds if not provided

if [ -z "$URL" ]; then
  echo "Usage: $0 <url> <interval_in_seconds>"
  exit 1
fi

echo "Starting continuous curl to $URL every $INTERVAL seconds..."
echo "Press CTRL+C to stop."

while true; do
  TIMESTAMP=$(date +"%Y-%m-%d %H:%M:%S")
  echo "[$TIMESTAMP] Curling $URL"
  curl -s -o /dev/null -w "HTTP %{http_code} | Time %{time_total}s\n" "$URL"
  sleep "$INTERVAL"
done
