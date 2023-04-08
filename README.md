# laptop

Laptop configuration for Arch Linux

## Requirements

- [Arch](https://archlinux.org/)

## Installation

```bash
# as root
pacman -S ansible git
usermod -aG sudo $USER

# as user
git clone https://github.com/aminnairi/laptop.git
cd laptop
ansible-playbook --ask-become-pass playbook.yml
```

Where `$USER` is the username to allow sudo rights.
