#!/bin/bash

function log() {
  echo "[POSTINSTALL] $1"
}

function is_installed() {
  pacman -Q "$1" > /dev/null 2>&1
}

function is_global_git_configuration_set() {
  test ! -z "$(git config --global "$1")"
}

function is_global_root_git_configuration_set() {
  test ! -z "$(sudo git config --global "$1")"
}

function ensure_git_configuration_set() {
  ensure_package_is_installed git

  if is_global_git_configuration_set "$1"
  then
    log "Configuration Git pour $1 déjà présente."
  else
    if log "Configuration Git pour $1 manquante, configuration en cours..." \
      && read -rp "Valeur pour $1 : " CONFIGURATION_VALUE \
      && git config --global "$1" "$CONFIGURATION_VALUE"
    then
      log "Configuration pour $1 installée."
    else
      log "Impossible de configurer $1 pour Git."
      return 1
    fi
  fi
}

function ensure_root_git_configuration_set() {
  ensure_package_is_installed git

  if is_global_root_git_configuration_set "$1"
  then
    log "Configuration administrateur Git pour $1 déjà présente."
  else
    if log "Configuration administrateur Git pour $1 manquante, configuration en cours..." \
      && read -rp "Valeur pour $1 : " CONFIGURATION_VALUE \
      && sudo git config --global "$1" "$CONFIGURATION_VALUE"
    then
      log "Configuration administrateur pour $1 installée."
    else
      log "Impossible de configurer $1 pour l'adminsitrateur Git."
      return 1
    fi
  fi
}

function ensure_yay_installed() {
  if ! is_installed yay
  then
    log "Installation de yay..."
    sudo pacman -Syyu --needed --noconfirm git base-devel \
      && rm -rf /tmp/yay \
      && mkdir --parent /tmp/yay \
      && git clone https://aur.archlinux.org/yay /tmp/yay \
      && cd /tmp/yay \
      && makepkg -sri --noconfirm --needed \
      && yay --version \
      && cd ... || exit
  fi
}

function ensure_system_is_updated() {
  ensure_yay_installed \
    && log "Mise à jour du système d'exploitation" \
    && yay --noconfirm --needed
}

function ensure_package_is_installed() {
  ensure_yay_installed

  if ! is_installed "$1"
  then
    log "Installation de $1..."
    yay -Syyu --noconfirm --needed "$1"
  else
    log "Paquet $1 déjà installé."
  fi
}

function ensure_package_group_is_installed() {
    local group_name="$1"
    local exit_status=0

    log "Vérification du groupe de paquets : $group_name"

    local members=$(pacman -Sg "$group_name" 2>/dev/null | awk '{print $2}')

    if [[ -z "$members" ]]
    then
      log "Le groupe '$group_name' n'existe pas ou ne contient aucun paquet." >&2
      return 1
    fi

    local missing_packages=""

    for pkg in $members; do
      if ! is_installed $pkg
      then
        missing_packages+="$pkg "
        exit_status=1
      fi
    done

    if [ $exit_status -eq 0 ]; then
        log "Le groupe '$group_name' est COMPLÈTEMENT installé."
        return 0
    else
        log "Le groupe '$group_name' est INCOMPLET. Paquets manquants :"
        for pkg in $missing_pkgs
        do
          ensure_package_is_installed $pkg
        done
    fi
}

function synchronize_user_folder() {
  log "Synchronisation du dossier $1 vers $2..." \
    && rsync --archive --quiet --delete "$1" "$2"
}

function synchronize_root_folder() {
  log "Synchronisation du dossier $1 vers $2..." \
    && sudo rsync --archive --quiet --delete "$1" "$2"
}

function ensure_group_is_installed() {
  if groups "$USER" | grep "$1" > /dev/null 2>&1
  then
    log "Groupe $1 déjà présent pour l'utilisateur $USER."
  else
    log "Groupe $1 absent pour l'utilisateur $USER, configuration..."
    sudo usermod -aG docker "$1"
  fi
}

function ensure_service_active() {
  local service_name="$1"

  if ! systemctl is-enabled --quiet "${service_name}"; then
    log "Le service '${service_name}' n'est pas activé. Activation en cours..."

    if ! sudo systemctl enable "${service_name}" > /dev/null 2>&1; then
      log "Impossible d'activer le service '${service_name}'."
    else
      log "Service $service_name activé."
    fi
  else
    log "Service $service_name déjà activé."
  fi

  if ! systemctl is-active --quiet "${service_name}"; then
    log "Le service '${service_name}' n'est pas démarré. Démarrage en cours..."

    if ! sudo systemctl start "${service_name}" > /dev/null 2>&1; then
        log "Impossible de démarrer le service '${service_name}'."
    else
      log "Service '${service_name}' démarré."
    fi
  else
    log "Service '${service_name}' déjà démarré."
  fi
}

function ensure_ssh_key_installed() {
  # Installing ssk-keygen and other OpenSSH related packages
  ensure_package_is_installed openssh

  if ls -d ~/.ssh/*.pub > /dev/null 2>&1
  then
    log "Clé SSH configurée sur ce système d'exploitation."
  else
    log "Aucune clé SSH configurée sur ce système d'exploitation."
    if ! ssh-keygen -t ed25519
    then
      log "Impossible d'installer la clé SSH."
      return 1
    fi
  fi
}

function ensure_shell_installed() {
  if grep "^$USER:.*:.*/$1$" /etc/passwd > /dev/null 2>&1
  then
    log "Shell $1 déjà installé pour l'utilisateur $USER."
    return 0
  fi

  log "Installation du shell $1 pour $USER."

  if sudo chsh -s fish "$USER"
  then
    log "Shell $1 installé pour $USER."
  else
    log "Echec lors de l'installation du shell $1 pour l'utilisateur $USER."
    return 1
  fi
}

function ensure_git_folder_installed_for_user() {
  local git_path="$1"
  local repo_dir="$2"

  local full_url="https://github.com/$git_path"

  if [[ -d "$repo_dir" ]]
  then
    log "Dossier $repo_dir existant, mise à jour..."

    if git -C "$repo_dir" pull --quiet
    then
      log "Dépôt $repo_dir mis à jour."
      return 0
    else
      log "Échec de la mise à jour du dépôt $repo_dir."
      return 1
    fi
  fi

  log "Dépôt $repo_dir innexistant, installation..."

  if git clone --quiet "$full_url" "$repo_dir"
  then
    log "Dépôt cloné avec succès dans $repo_dir."
    return 0
  else
    log "Échec du clonage de $full_url."
    return 1
  fi
}

function ensure_git_folder_installed_for_root() {
  local git_path="$1"
  local repo_dir="$2"

  local full_url="https://github.com/$git_path"

  if sudo test -d "$repo_dir"
  then
    log "Dossier $repo_dir existant, mise à jour..."

    if sudo git -C "$repo_dir" pull --quiet
    then
      log "Dépôt $repo_dir mis à jour."
      return 0
    else
      log "Échec de la mise à jour du dépôt $repo_dir."
      return 1
    fi
  fi

  log "Dépôt $repo_dir innexistant, installation..."

  if sudo git clone --quiet "$full_url" "$repo_dir"
  then
    log "Dépôt cloné pour l'administrateur avec succès dans $repo_dir."
    return 0
  else
    log "Échec du clonage pour l'administrateur de $full_url."
    return 1
  fi
}

function ensure_gnome_setting_set() {
  local setting_schema="$1"
  local setting_key="$2"
  local setting_value="$3"

  if gsettings get "$setting_schema" "$setting_key" > /dev/null 2>&1
  then
    log "Paramètre $setting_schema déjà paramétré."
    return 0
  fi

  if ! gsettings set "$setting_schema" "$setting_key" "$setting_value"
  then
    log "Echec lor de la configuration du paramètre $1."
    return 1
  fi

  log "Paramètre $setting_schema $setting_key paramétré avec succès."
}

function ensure_mkinitcpio_configured_for() {
  local kernel="$1"

  if sudo mkinitcpio -p "$kernel"
  then
    log "Noyau $kernel installé."
  else
    log "Echec lors de l'installation du noyau $kernel, ne redémarrez surtout pas !"
  fi
}
