#!/bin/bash

# Removed libreoffice signal-desktop gnome-keyring localsend-bin
if [ -z "$OMARCHY_BARE" ]; then
  yay -S --noconfirm --needed \
    gnome-calculator obsidian-bin obs-studio kdenlive xournalpp

  # Packages known to be flaky or having key signing issues are run one-by-one
  # Removed pinta and zoom
  for pkg in typora spotify; do
    yay -S --noconfirm --needed "$pkg" ||
      echo -e "\e[31mFailed to install $pkg. Continuing without!\e[0m"
  done

  # yay -S --noconfirm --needed 1password-beta 1password-cli ||
    # echo -e "\e[31mFailed to install 1password. Continuing without!\e[0m"
fi

# Copy over Omarchy applications
source omarchy-refresh-applications || true
