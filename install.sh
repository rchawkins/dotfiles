#!/bin/bash
# install.sh - script to install dotfiles

set -eu -o pipefail

SCRIPT_DIR=$(dirname "${BASH_SOURCE[0]}")
DOTFILES_DIR=$(cd "${SCRIPT_DIR}" && pwd)
BACKUP_DIR="${HOME}/.dotfiles_backup/$(date +%Y%m%d_%H%M%S)"

# Detect OS
OS="unknown"
if [[ "$OSTYPE" == "darwin"* ]]; then
    OS="macos"
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    OS="linux"
fi
echo "Detected OS: ${OS}"

echo "Creating directories..."
mkdir -p "${HOME}/.config/"
mkdir -p "${HOME}/.local/bin"

# Backup existing file 
backup_file() {
    local file="$1"
    local backup_path="${BACKUP_DIR}/$(dirname "${file#${HOME}/}")"

    if [[ -e "${file}" ]]; then
        echo "Backing up ${file}"
        mkdir -p "${backup_path}"
        cp -RL "${file}" "${backup_path}"
    fi
}

# Install a dotfile via symlink
install_file() {
    local src="$1"
    local dest="$2"

     # create the full path if dest is directory
    if [[ -d "$dest" ]]; then
        dest="${dest}/$(basename "$src")"
    fi
    
    # Skip if the link is already correctly set up
    if [[ -L "${dest}" ]] && [[ "$(readlink "${dest}")" == "${src}" ]]; then
        echo "Link already exists: ${dest} -> ${src}"
        return 0
    fi

    backup_file "${dest}"
    
    echo "Installing ${src} to ${dest}"
    ln -sf "${src}" "${dest}"
}

# Install Homebrew packages on macOS
if [[ "$OS" == "macos" ]]; then
    if command -v brew >/dev/null 2>&1; then
        echo "Installing brew programs"
        brew bundle --file=${DOTFILES_DIR}/Brewfile
    else
        echo "Homebrew is not installed. Skipping brew bundle."
        echo "To install Homebrew, visit: https://brew.sh"
    fi
fi

echo "Installing dotfiles"

# bin
install_file "${DOTFILES_DIR}/bin/colors.sh" "${HOME}/.local/bin/"

# zsh
install_file "${DOTFILES_DIR}/.zshrc" "${HOME}/.zshrc"
install_file "${DOTFILES_DIR}/.zprofile" "${HOME}/.zprofile"
install_file "${DOTFILES_DIR}/.zshenv" "${HOME}/.zshenv"
install_file "${DOTFILES_DIR}/.kubectl_aliases" "${HOME}/.kubectl_aliases"

# bash
install_file "${DOTFILES_DIR}/.bash_profile" "${HOME}/.bash_profile"
install_file "${DOTFILES_DIR}/.bashrc" "${HOME}/.bashrc"

# git
install_file "${DOTFILES_DIR}/.gitconfig" "${HOME}/.gitconfig"
install_file "${DOTFILES_DIR}/.gitignore" "${HOME}/.gitignore"

# Neovim
mkdir -p "${HOME}/.config/nvim/lua/core/"
mkdir -p "${HOME}/.config/nvim/lua/plugins/"
install_file "${DOTFILES_DIR}/.config/nvim/init.lua" "${HOME}/.config/nvim/"
install_file "${DOTFILES_DIR}/.config/nvim/lua/core/keymaps.lua" "${HOME}/.config/nvim/lua/core/"
install_file "${DOTFILES_DIR}/.config/nvim/lua/core/options.lua" "${HOME}/.config/nvim/lua/core/"
install_file "${DOTFILES_DIR}/.config/nvim/lua/plugins/init.lua" "${HOME}/.config/nvim/lua/plugins/"

# ghostty
if [[ "$OS" == "macos" ]]; then
    mkdir -p "${HOME}/.config/ghostty"
    install_file "${DOTFILES_DIR}/.config/ghostty/config" "${HOME}/.config/ghostty/"
fi

# Linux-specific configurations
if [[ "$OS" == "linux" ]]; then
    # Add Linux-specific configurations here if needed
    echo "Setting up Linux-specific configurations..."
fi

echo ""
echo "Dotfiles installation complete!"
echo "Backup of previous dotfiles can be found in: ${BACKUP_DIR}"
echo ""
echo "All done! Restart your terminal or run 'source ~/.zshrc' to apply changes."
