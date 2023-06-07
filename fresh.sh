#!/bin/bash

MAX_AGE=$((24 * 60 * 60))  # Maximum age in seconds (24 hours)

if [ -z "$1" ]; then
  read -p "Enter the file URL: " URL
else
  URL=$1
fi

if [ -z "$URL" ]; then
  echo "URL cannot be blank. Exiting..."
  exit 1
fi

FILE_NAME=$(basename "$URL")

# Check if the file already exists
if [ -f "$FILE_NAME" ]; then
  echo "File '$FILE_NAME' already exists."
  read -p "Do you want to resume the download? (y/n): " RESUME

  if [ "$RESUME" != "y" ]; then
    echo "Exiting..."
    exit 0
  fi
fi

# Get the last modified timestamp of the file
LAST_MODIFIED=$(curl -s -I "$URL" | grep -i "Last-Modified" | awk -F': ' '{print $2}' | tr -d '\r')

if [ -n "$LAST_MODIFIED" ]; then
  FILE_TIMESTAMP=$(date -d "$LAST_MODIFIED" +%s)
  CURRENT_TIMESTAMP=$(date +%s)
  AGE=$((CURRENT_TIMESTAMP - FILE_TIMESTAMP))

  if [ "$AGE" -lt "$MAX_AGE" ]; then
    echo "File is under 24 hours old. Downloading..."

    if [ -f "$FILE_NAME" ]; then
      curl -C - -O "$URL"
    else
      curl -O "$URL"
    fi

    if [ $? -eq 0 ]; then
      echo "Download complete."
    else
      echo "Download interrupted."
    fi
  else
    echo "File is older than 24 hours."
  fi
else
  echo "Unable to retrieve Last-Modified header. Skipping download."
fi
