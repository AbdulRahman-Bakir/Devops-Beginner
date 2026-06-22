# Server Stats

roadmap.sh project: https://roadmap.sh/projects/server-stats

A Bash script that reports basic performance stats for a Linux server.

## What it shows
- **Total CPU usage** (%)
- **Memory usage** — total / used / free, plus used and free percentages
- **Disk usage** (of `/`) — total / used / free, plus used and free percentages
- **Top 5 processes by CPU usage**
- **Top 5 processes by memory usage**

## Requirements
- Linux (or WSL / Git Bash on Windows)
- Standard tools: `top`, `free`, `df`, `ps`, `awk`, `grep`, `sed`

> Note: this relies on Linux-specific tools (`free`, `/proc`-backed `top`).
> It will **not** produce correct output on native macOS or Windows.

## Usage
```bash
bash server-stats.sh
# or, after making it executable:
chmod +x server-stats.sh
./server-stats.sh
```
