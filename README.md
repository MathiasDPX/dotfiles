# dotenv

# Git with Yubikey

If your SSH key is added through `ssh-add -K`, on Windows, you need to tell Git to use OpenSSH instead of its own ssh

```sh
git config --global core.sshCommand "C:/Windows/System32/OpenSSH/ssh.exe"
```

# GPG Setup

Run this in your terminal to install the GPG key (Linux / MacOS only)

```sh
curl -fsSL https://raw.githubusercontent.com/mathiasdpx/dotfiles/main/setup-gpg.sh | bash
```