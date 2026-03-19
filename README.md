# 🗃️ dotfiles

My personal software installation & configuration

![image](https://github.com/aminnairi/dotfiles/assets/18418459/9a3f32a0-76bb-4b67-bf8e-7a4db65e7589)

## ☣️ Disclaimer

This is a repository that I keep public in order to ease out the installation
of my different computers.

The repository is not intended to be used as-is by many people, although
special attention and care has been put in order to make it sensibly easy to be
used by anyone wanting to try out this installation.

Although the goal for any non-contributor is to get inspiration, not to use it
as you daily driver. Nothing can stop you from doing it so feel free to do so
and open issues, but I can't guarantee to be available to fix issues.

## 🔥 Features

- Gnome with Pipewire to get the maximum of our audio/video
- `nvim` with a ton of plugins for web development & Linux stuff
- `helix` setup & configured with support for `lazygit` and `lazydocker`
- Tons of browsers (actually just 4 but this is something) like `chromium`,
  `google-chrome`, `opera` & `firefox`
- `docker` enabled for the unprivileged user so commands don't need prefixing
  with `sudo` anymore
- `tmux` for terminal multiplexing with automatic installation & update of
  plugins before starting `tmux`
- `yazi` to manipulate your file system using the `y` fish function
- Enhanced `ls` command with colors & icons just like in VSCode
- Enhanced `cat` command with syntactic colorization of files just like in
  VSCode
- Custom `privateinternetaccess` function that lets you choose a configuration
  from OpenVPN using `fzf` for starting a new `openvpn` tunnel quickly
- Get the latest weather news right in your terminal with `wttr`
- Support for both `intel` & `amd` architecture (pull requests welcome to add
  VirtualBox & VMware Guest Additions)
- `ufw` enabled and ready to protect your personal life
- Lots of programming language's interpreter & compiler installed (Python, Ruby,
  PHP, Julia, ...)
- Tons of Fish's abbreviations for `docker` & `docker-compose`
- `posting` for HTTP requests in the terminal
- `ticker` for watching various tickers from stocks & cryptos using Yahoo Finance tickers
- `slides` for presenting markdown files directly in the terminal
- `duf` & `dust` for better replacement of `du` and `df`

## 📖 Requirements

- [Archlinux](https://archlinux.org/)
- [GNU/Bash](https://www.gnu.org/software/bash/)

## ⚙️ Setup

### 💻 Hardware Installation

Coming soon...

### 👮 Create the user as administrator

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

### 🧔 Installation as user

```bash
# Clone the repository in the home folder
git clone https://github.com/aminnairi/dotfiles ~/Documents/git/github.com/aminnairi/dotfiles

# Change the current working directory to the source-code for the installation script
cd ~/Documents/git/github.com/aminnairi/dotfiles

# Apply the configuration
bash post-install.sh
```

## 🚀 Running the Installation Script

### 📋 Prerequisites

Before running the installation script, ensure you have:

1. **Arch Linux** installed
2. **Fish shell** installed: `sudo pacman -S fish`
3. **Git** installed: `sudo pacman -S git`
4. **Sudo privileges** for your user account

### 🛠️ Installation Methods

#### Method 1: Using the main script (Recommended)

The main script provides an interactive interface for choosing different configurations:

```bash
# Run in interactive mode (recommended)
bash main.sh

# Run with a specific configuration file
bash main.sh ansible/amd-gnome.yml
```

#### Method 2: Using the post-install script

The post-install script runs all modules sequentially:

```bash
bash post-install.sh
```

### 📝 What to Expect During Installation

1. **System updates**: The script will update your system packages
2. **Module execution**: Each module installs specific software and configurations
3. **Plugin installations**: Neovim and Tmux plugins will be installed on first run
4. **Configuration setup**: Fish shell configurations and aliases will be set up
5. **Service configuration**: System services will be enabled and configured

### ⚠️ Important Notes

- **Reboot required**: After installation, reboot your system for all changes to take effect
- **First-time software runs**: Some applications (like Neovim and Tmux) need to be run once to install their plugins
- **SSH setup**: The script will prompt you to create SSH keys if none exist
- **Backup important files**: Consider backing up existing configurations before installation

### 🔧 Post-Installation Steps

1. **Reboot your system**: `sudo reboot`
2. **Initialize Neovim plugins**: Run `nvim` (this will install plugins automatically)
3. **Initialize Tmux plugins**: Run `tmux` (this will install plugins automatically)
4. **Verify installations**: Check that all installed software works correctly
5. **Customize configurations**: Edit configuration files in `~/.config/` as needed

## ℹ️ Informations

### ✒️ Neovim

[Neovim](https://neovim.io/)'s plugins gets installed only when run. Try
running `nvim` at least once per user `root` and the chosen unprivileged user.

### ✈️ Tmux

[Tmux](https://github.com/tmux/tmux)'s plugins get installed once it is run
without argument. A Fish function gets triggered whenever `tmux` is run. If it
has no argument, then plugins gets checked and installed. If it has arguments,
plugins do not get installed nor checked. Please run at least once `tmux` in
order to install the necessary plugins before using it.

### 🔐 SSH

It's a good idea to backup your existing `~/.ssh/config` file before erasing
the informations contained in a previous computer.

Once the new computer is installed, don't forget to create a new SSH key using
`ssh-keygen -t ed25519` and to propagate this key to the relevant services
(servers, GitHub, GitLab, ...). Although the `post-install.sh` script should
already have prompted you to create a new key if it did not detect one.

### 🦆 Yazi

[Yazi](https://yazi-rs.github.io/) is a terminal file explorer that is written
in Rust and has default keybinding using Vim motions, can render images in the
terminal and is able to run a bunch of programs by default whenever hitting
enter on one of them.

A fish function runs yazi by hitting `y` in the terminal for added velocity and
is able to remmeber the folder you were in when you quit the explorer.

## ✨ Feature request, bug report & vulnerability report

See [`issues`](./issues).

## 🙋 Code of conduct

See [`CODE_OF_CONDUCT`](./CODE_OF_CONDUCT.md).

## 💪 Contributing

See [`CONTRIBUTING.md`](./CONTRIBUTING.md).

## 📃 License

See [`LICENSE`](./LICENSE).

## 🛡️ Security

See [`SECURITY.md`](./SECURITY.md).
