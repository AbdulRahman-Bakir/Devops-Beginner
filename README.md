# DevOps Projects

Solutions to DevOps practice projects from [roadmap.sh](https://roadmap.sh).
The shell scripts are written for a Linux/Bash environment (run via WSL, Git Bash,
or any Linux host).

## Projects

| Project | roadmap.sh task |
| --- | --- |
| [Server Stats](./Server-Stats) | https://roadmap.sh/projects/server-stats |
| [Log Archive Tool](./log-archive-tool) | https://roadmap.sh/projects/log-archive-tool |
| [Nginx Log Analyser](./Nginx-Log-Analyser) | https://roadmap.sh/projects/nginx-log-analyser |
| [GitHub Pages Deployment](./Github-Pages-Deployment) | https://roadmap.sh/projects/github-actions-deployment-workflow |
| [SSH Remote Server Setup](./SSH-Remote-Server-Setup) | https://roadmap.sh/projects/ssh-remote-server-setup |

## Usage

### Server Stats
Prints CPU, memory, and disk usage plus the top 5 processes by CPU and RAM.
```bash
bash Server-Stats/server-stats.sh
```

### Log Archive Tool
Compresses a target directory into a timestamped `.tar.gz` under `log-archives/`
and appends a record to `logs.txt`.
```bash
bash log-archive-tool/log-archive.sh /path/to/logs
```

### Nginx Log Analyser
Parses an nginx `access.log` and reports the top 5 IPs, paths, status codes,
and user agents. Run it from inside the project folder (it reads `access.log`):
```bash
cd Nginx-Log-Analyser && bash log-analyser.sh
```

### GitHub Pages Deployment
A GitHub Actions workflow that deploys a static `index.html` to GitHub Pages on
push to `main`. To actually deploy, the contents of this folder must live at the
**root** of a dedicated repository (the workflow at `.github/workflows/deploy.yml`),
with GitHub Pages set to "GitHub Actions" as the source.

### SSH Remote Server Setup
Sets up a remote Linux server (AWS EC2) and configures SSH access using two
separate key pairs, plus a `~/.ssh/config` alias for quick connection. See the
project folder for the full write-up.