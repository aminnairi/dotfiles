# laptop

Laptop configuration for Arch Linux

## Requirements

- [Arch](https://archlinux.org/)

## Installation

### As root

```bash
# (as root) Install the necessary dependencies
pacman -S ansible git which sudo

# (as root) Allow the "sudo" group to issue sudo commands
sed -i 's/#\s*%sudo/%sudo/g' /etc/sudoers

# (as root) Create a new user
useradd --create-home user

# (as root) Add a password for the newly created user
passwd user

# (as root) Add the "sudo" group for the created user
usermod -aG sudo user
```

### As user

```bash
# (as user) Pull the latest configuration and apply the latter
ansible-pull --url https://github.com/aminnairi/laptop.git --ask-become-pass
```
