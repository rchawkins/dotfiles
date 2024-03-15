#!/bin/bash

ts=$(date +%F_%H_%M_%S)
# dotfiles_dir="dotfiles"
script_dir=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

function backup_and_link() {
  filename="$1"
  target="${HOME}/${filename}"
  source="${script_dir}/${filename}"

  if [ "$(readlink "${target}")" = "${source}" ]; then
    echo "${filename} already linked"
    return
  fi

  if [ -f "${target}" ]; then
    echo "Backing up ${filename} as ${filename}.bak.${ts}"
    mv "${target}" "${target}.bak.${ts}"
  fi

  echo "Linking ${target} -> ${source}"
  ln -snf "${source}" "${target}"
}

backup_and_link .bashrc
backup_and_link .emacs.d
backup_and_link .gitconfig
backup_and_link .zprofile
backup_and_link .zshrc

