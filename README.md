# laptop

Laptop configuration for Arch Linux

## Requirements

- [Archlinux](https://archlinux.org/)
- [GNU/Bash](https://www.gnu.org/software/bash/)

## Setup

### Setup the variables needed for running the playbook

```bash
mkdir --parent ansible/roles/user/vars
touch ansible/roles/user/vars/main.yml
```

```yaml
---
user:
  name: "change-me"
  password: "change-me"
  groups: sudo
  uid: 1000
  shell: /bin/fish
root:
  shell: /bin/fish
```

### Installation of the necessary dependencies

```bash
# Clone the repository
git clone https://github.com/aminnairi/laptop.git

# Change the current working directory
cd laptop

# Apply the configuration
bash main.sh
```

### Configuration of the used programs

#### Configuration of Bitwarden

```bash
rbw config set email <email>
```

Where `<email>` is the email to use for Bitwarden.

#### Configuration of i3

```bash
touch i3/i3status/settings.json
```

```json
{
  "weather": {
    "appid": "your-openweathermap-api-key-here"
  }
}
```

#### Startup of i3

```bash
startx
```

## Shortcuts

Shortcut | Description
---|---
`Super + x` | Lock the screen
`Super + p` | Start a new screenshot
