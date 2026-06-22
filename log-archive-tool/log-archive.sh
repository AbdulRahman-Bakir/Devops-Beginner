#!/bin/bash

  if [ -n "$1" ]
  then
    if [ -d "$1" ]
    then
      printf "The provided argument is a directory: %s\n" "$1"

      ts=$(date +"%Y%m%d_%H%M%S")
      script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
      archive_dir="$script_dir/log-archives"
      archive_file="$archive_dir/logs_archive_$ts.tar.gz"

      mkdir -p "$archive_dir"
      tar -czf "$archive_file" "$1"

      printf "[%s] Archived %s to %s\n" "$ts" "$1" "$archive_file" >> "$script_dir/logs.txt"
      printf "Archiving succeeded\n"
    else
      printf "The provided argument is not a directory: %s\n" "$1"
    fi
  else
    printf "There is no argument provided when running the script.\n"
  fi
