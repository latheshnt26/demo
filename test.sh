#!/bin/bash

# Get the payload from GitHub
payload=$(cat)
echo "Payload ${payload}"
# Extract relevant information from the payload using jq
changed_files=$(echo "$payload" | jq -r '.commits[].added + .commits[].modified')

# Check if any new files are added inside the "demo" directory
if echo "$changed_files" | grep -q '^demo/'; then
  echo "Code changes are fine. New file added inside the 'demo' directory."
else
  echo "Code changes are not fine. Please add a new file inside the 'demo' directory."
  # You might want to exit with a non-zero status code to indicate an issue
  exit 1
fi
