# SSH Remote Server Setup

A DevOps learning project: set up a remote Linux server and configure it to allow SSH connections using two separate SSH key pairs.

**Project source:** [roadmap.sh/projects/ssh-remote-server-setup](https://roadmap.sh/projects/ssh-remote-server-setup)

## Goal

Set up a remote Linux server and be able to SSH into it using **two different SSH keys**, then configure a `~/.ssh/config` alias for quick access.

## Environment

- **Provider:** AWS EC2
- **OS:** Amazon Linux 2023
- **Default user:** `ec2-user`
- **Client machine:** Windows (PowerShell with built-in OpenSSH)

---

## Steps

### 1. Launch the server

Launched an EC2 instance running Amazon Linux 2023 and downloaded the AWS-generated key pair (`aws-learning-key.pem`).

In the instance's **security group**, added an inbound rule allowing **SSH (port 22)** from my IP.

### 2. Fix the private key permissions (Windows)

Windows requires the private key to be readable only by the current user, otherwise SSH refuses to use it:

```powershell
icacls "path\to\aws-learning-key.pem" /reset
icacls "path\to\aws-learning-key.pem" /inheritance:r
icacls "path\to\aws-learning-key.pem" /grant:r "$(whoami):R"
```

### 3. Connect with the AWS key

```bash
ssh -i "path\to\aws-learning-key.pem" ec2-user@<server-ip>
```

### 4. Create two new SSH key pairs (on the local machine)

```bash
ssh-keygen -t ed25519 -f ~/.ssh/key1 -C "key1"
ssh-keygen -t ed25519 -f ~/.ssh/key2 -C "key2"
```

This produces:
- `key1` / `key1.pub`
- `key2` / `key2.pub`

The `.pub` files are the **public keys** (safe to share, go on the server). The other two are the **private keys** (kept secret on the local machine).

### 5. Add both public keys to the server

Printed each public key locally:

```bash
cat ~/.ssh/key1.pub
cat ~/.ssh/key2.pub
```

Then, while connected to the server with the AWS key, appended both public-key lines to the authorized keys file:

```bash
nano ~/.ssh/authorized_keys
```

The file now contains the original AWS key plus both new public keys.

### 6. Test connecting with both new keys

```bash
ssh -i ~/.ssh/key1 ec2-user@<server-ip>
ssh -i ~/.ssh/key2 ec2-user@<server-ip>
```

Both keys successfully log in. ✅

### 7. Configure the SSH alias

Created `~/.ssh/config` (no file extension) with:

```
Host myserver
    HostName <server-ip>
    User ec2-user
    IdentityFile ~/.ssh/key1
```

Now the server is reachable with a single command:

```bash
ssh myserver
```

---

## Outcome

- Remote Linux server running on AWS EC2.
- Two independent SSH key pairs, both able to authenticate.
- `ssh myserver` alias configured for quick access.

## Stretch Goal (optional): fail2ban

`fail2ban` bans IP addresses that repeatedly fail to log in, protecting against brute-force attacks.

```bash
sudo dnf install fail2ban -y
sudo cp /etc/fail2ban/jail.conf /etc/fail2ban/jail.local
sudo nano /etc/fail2ban/jail.local
```

In the `[sshd]` section:

```
[sshd]
enabled = true
port    = ssh
maxretry = 5
```

Then enable and start it:

```bash
sudo systemctl enable --now fail2ban
sudo fail2ban-client status sshd
```

---

## Note

The private keys were **not** committed to any repository. This README documents only the steps taken, as required by the project.