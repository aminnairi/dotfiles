# laptop

Laptop configuration for Arch Linux

## Requirements

- [Arch](https://archlinux.org/)

## Installation

### As root

```bash
# Install the necessary dependencies
pacman -S ansible git which sudo

# Allow the "sudo" group to issue sudo commands
sed -i 's/#\s*%sudo/%sudo/g' /etc/sudoers

# Create a new user
useradd --create-home user

# Add a password for the newly created user
passwd user

# Add the "sudo" group for the created user
usermod -aG sudo user
```

### As user

```bash
# Pull the latest configuration and apply the latter
ansible-pull \
  --url https://github.com/aminnairi/laptop.git \
  --ask-become-pass \
  playbook.yml
```
