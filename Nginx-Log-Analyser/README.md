# Nginx Log Analyser

roadmap.sh project: https://roadmap.sh/projects/nginx-log-analyser

A Bash script that analyses an nginx `access.log` (combined log format) and
reports the most frequent entries using `awk`, `sort`, and `uniq`.

## What it reports
- **Top 5 IP addresses** with the most requests
- **Top 5 most requested paths**
- **Top 5 response status codes**
- **Top 5 user agents** with the most requests

## Requirements
- Linux (or WSL / Git Bash on Windows)
- `awk`, `sort`, `uniq`, `head`

## Input
The script reads a file named **`access.log`** in the current directory.
A sample `access.log` is included so it runs out of the box. To analyse your own
logs, replace that file (it must be in nginx **combined** format).

## Usage
```bash
cd Nginx-Log-Analyser
bash log-analyser.sh
```
