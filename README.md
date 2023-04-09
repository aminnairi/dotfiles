# laptop

Laptop configuration for Arch Linux

## Requirements

- [Arch](https://archlinux.org/)

## Installation

```bash
# as root
pacman -S ansible git which
usermod -aG sudo $USER

# as user
ansible-pull --url https://github.com/aminnairi/laptop.git --ask-become-pass
```

Where `$USER` is the username to allow sudo rights.
