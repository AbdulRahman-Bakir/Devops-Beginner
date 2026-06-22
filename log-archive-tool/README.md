# Log Archive Tool

roadmap.sh project: https://roadmap.sh/projects/log-archive-tool

A Bash tool that compresses a given directory of logs into a single
timestamped `.tar.gz` archive and keeps a record of every run.

## How it works
1. Takes a **directory path** as its only argument.
2. Validates that the argument is provided and is an existing directory.
3. Creates a `log-archives/` folder next to the script (if missing).
4. Archives the target into `log-archives/logs_archive_<YYYYMMDD_HHMMSS>.tar.gz`.
5. Appends a line to `logs.txt` recording the timestamp, source, and archive path.

The archive directory is resolved relative to the script's own location, so the
tool works no matter where the repo is cloned.

## Requirements
- Linux (or WSL / Git Bash on Windows)
- `tar`, `date`

## Usage
```bash
bash log-archive.sh /path/to/logs
# example:
bash log-archive.sh /var/log
```

## Output
- Archives: `log-archives/logs_archive_<timestamp>.tar.gz`
- Run log:  `logs.txt`

> Generated archives and `logs.txt` are git-ignored — only the script is tracked.
> `texts/` contains sample input you can archive as a quick test.
