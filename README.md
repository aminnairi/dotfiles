# laptop

Laptop configuration for Arch Linux

## Requirements

- [Arch](https://archlinux.org/)

## Installation

```bash
# (as root) Install the necessary dependencies
pacman -S ansible git which sudo
sed -i 's/#\s*%sudo/%sudo/g' /etc/sudoers
usermod -aG sudo $USER

# as user
ansible-pull --url https://github.com/aminnairi/laptop.git --ask-become-pass
```

Where `$USER` is the username to allow sudo rights.
