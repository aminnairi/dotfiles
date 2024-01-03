# dotfiles

My personal software installation & configuration

## Disclaimer

This is a repository that I keep public in order to ease out the installation of my different computers.

The repository is not intended to be used as-is by many people, although special attention and care has been put in order to make it sensibly easy to be used by anyone wanting to try out this installation.

Although the goal for any non-contributor is to get inspiration, not to use it as you daily driver. Nothing can stop you from doing it so feel free to do so and open issues, but I can't guarantee to be available to fix issues.

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
useradd --create-home --shell /bin/fish --groups sudo --uid 1000 user

# Setup the password for the unprivileged user
passwd user
```

### Laptop installation as user

```bash
# Clone the repository in the home folder
git clone https://github.com/aminnairi/dotfiles ~/Documents/git/github.com/aminnairi/dotfiles

# Change the current working directory to the source-code for the installation script
cd ~/Documents/git/github.com/aminnairi/dotfiles

# Apply the configuration
bash main.sh
```

## Informations

### Neovim

Neovim's plugins gets installed only when run. Try running `nvim` at least once per user `root` and the choosen unprivileged user.

### Tmux

Tmux's plugins get installed once it is run without argument. A Fish function gets triggered whenever `tmux` is run. If it has no argument, then plugins gets checked and installed. If it has arguments, plugins do not get installed nor checked. Please run at least once `tmux` in order to install the necessary plugins before using it.

## License

See [`LICENSE`](./LICENSE).
