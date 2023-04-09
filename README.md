# laptop

Laptop configuration for Arch Linux

## Requirements

- [Arch](https://archlinux.org/)

## Installation

```bash
# (as root) Install the necessary dependencies
pacman -S ansible git which sudo

# (as root) Allow the "sudo" group to issue sudo commands
sed -i 's/#\s*%sudo/%sudo/g' /etc/sudoers

# (as root) Create a new user
useradd --create-home user

# (as root) Add a password for the newly created user
passwd user

ansible-pull --url https://github.com/aminnairi/laptop.git --ask-become-pass
```

Where `$USER` is the username to allow sudo rights.
