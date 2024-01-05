# 🗃️ dotfiles

My personal software installation & configuration

![image](https://github.com/aminnairi/dotfiles/assets/18418459/f618bf84-e676-4c78-b249-27092f6879e7)

## ☣️ Disclaimer

This is a repository that I keep public in order to ease out the installation of my different computers.

The repository is not intended to be used as-is by many people, although special attention and care has been put in order to make it sensibly easy to be used by anyone wanting to try out this installation.

Although the goal for any non-contributor is to get inspiration, not to use it as you daily driver. Nothing can stop you from doing it so feel free to do so and open issues, but I can't guarantee to be available to fix issues.

## 📖 Requirements

- [Archlinux](https://archlinux.org/)
- [GNU/Bash](https://www.gnu.org/software/bash/)

## ⚙️ Setup

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
bash main.sh
```

You can also feed the script with the path to an existing playbook if you don't want to be prompted to choose one.

```bash
# Or by providing the path to an existing playbook directly
bash main.sh ansible/amd-gnome.yml
```

## 🐛 Error codes

An error code is returned each time you run this script and an error occurred.

In order to get the specific error code, you can use the `$?` variable in bash.

```bash
echo $?
```

Refer to the list below to know what happened in order to take remediation action.

Note that a friendly error message will also appear in case an error occurs, that way you don't have to manually check for these error codes.

This is documented in case you want to include this script in a bigger program or system and you probably don't ever need to read the following if you are a end-user of this script.

### 🪲 1 (ERROR_BECAUSE_ROOT)

This error code is returned whenever you try to run this script as root.

This script should only be run as the unprivileged user that has `sudo` access only.

Morever, this script contains routines that needs to be run as a non-root, for instance, the installation of Arch User Repository packages.

### 🪲 2 (ERROR_BECAUSE_NOT_ARCH_LINUX)

This error code is returned whenever you try to run this script in an operating system that has no `pacman` executable installed.

This script has been made specifically to install this configuration for Arch operating systems only.

Feel free to fork this project and to update its source-code if you wish to support other operating systems as well. You are encouraged to propose pull requests as well.

### 🪲 3 (ERROR_BECAUSE_TOO_MUCH_ARGUMENTS_PROVDED)

This error code is returned whenever you try to call this script with too much arguments.

Too much arguments means that you tried to pass more than one argument, since this script only take at most one argument which is the path to a playbook containing the wanted configuration.

You can find the list of available configuration at the [`ansible`](./ansible) folder (every file that ends with a `*.yml` extension is a playbook).

### 🪲 4 (ERROR_BECAUSE_ANSIBLE_INSTALLATION_FAILED)

This error code is returned whenever you try to call this script and your operating system does not have the `ansible` package installed.

If the installation of `ansible` has failed, this script will return the error, otherwise, it will simply continue with the installation.

### 🪲 5 (ERROR_BECAUSE_PLAYBOOK_INVALID_OR_NOT_FOUND)

This error code is returned whenever you try to call this script interactively, meaning you did not provide any path to a playbook, and this script will let you choose for a wanted configuration.

If the index you choosed is incorrect, then the error will be returned.

### 🪲 6 (ERROR_BECAUSE_PLAYBOOK_PATH_DOES_NOT_EXIST)

This error code is returned whenever you try to call this script with an argument, which is the path to a playbook (configuration for the installation) you know you want to use.

If the playbook's path choosen is not found, then you'll get an error.

## ℹ️ Informations

### ✒️ Neovim

[Neovim](https://neovim.io/)'s plugins gets installed only when run. Try running `nvim` at least once per user `root` and the choosen unprivileged user.

### ✈️ Tmux

Tmux's plugins get installed once it is run without argument. A Fish function gets triggered whenever `tmux` is run. If it has no argument, then plugins gets checked and installed. If it has arguments, plugins do not get installed nor checked. Please run at least once `tmux` in order to install the necessary plugins before using it.

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
