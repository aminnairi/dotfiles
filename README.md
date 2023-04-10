# laptop

Laptop configuration for Arch Linux

## Requirements

- [Arch](https://archlinux.org/)

## Installation

### As root

```bash
# Install the necessary dependencies
pacman -Syy ansible git which sudo

# Allow the "sudo" group to issue sudo commands
sed -i 's/#\s*%sudo/%sudo/g' /etc/sudoers

# Create a new user
useradd --create-home user

# Add a password for the newly created user
passwd user

# Add the sudo group
groupadd sudo

# Add the "sudo" group for the created user
usermod --add --groups sudo user
```

### As user

#### Installation

```bash
git clone https://github.com/aminnairi/laptop.git
cd laptop
echo '{"weather":{"appid":"..."}}' > i3/i3status/settings.json
ansible-playbook --ask-become-pass playbook.yml
```

