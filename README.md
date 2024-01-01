# laptop

Laptop configuration for Arch Linux

## Requirements

- [Archlinux](https://archlinux.org/)
- [GNU/Bash](https://www.gnu.org/software/bash/)

## Setup

### Create the user as administrator

```bash
# Install the necessary dependencies
pacman -S sudo fish git

# Allow members of the group "sudo" to issue sudo commands
sed -i 's/# %sudo/%sudo/g' /etc/sudoers

# Add the "sudo" group
groupadd sudo

# Add the unprivileged user
useradd --create-home --shell --groups sudo --uid 1000 /bin/fish user

# Setup the password for the unprivileged user
passwd user
```

### Laptop installation as user

```bash
# Clone the repository in the home folder
git clone https://github.com/aminnairi/laptop.git ~/Documents/git/github.com/aminnairi/laptop

# Change the current working directory to the source-code for the installation script
cd ~/Documents/git/github.com/aminnairi/laptop

# Apply the configuration
bash main.sh
```
