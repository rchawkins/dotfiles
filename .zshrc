autoload -U compinit && compinit
autoload -U colors && colors

## zsh
export HISTFILE="$HOME/.zsh_history"
export HISTSIZE=1000000
export SAVEHIST=1000000

setopt BANG_HIST                 # Treat the '!' character specially during expansion.
setopt EXTENDED_HISTORY          # Write the history file in the ":start:elapsed;command" format.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space.

# enable comments during an interactive session
setopt interactivecomments

## prompt
# see vcs_info examples here: https://sourceforge.net/p/zsh/code/ci/master/tree/Misc/vcs_info-examples
autoload -Uz vcs_info

zstyle ':vcs_info:*' enable git

# enables checking for unstaged (%u) and staged (%c); can be slow on large repos
# zstyle ':vcs_info:*' check-for-changes true

# faster than 'check-for-changes', but only sets staged changes (%c)
zstyle ':vcs_info:git:*' check-for-staged-changes true

# Set custom strings for (un)staged changes
zstyle ':vcs_info:git:*' unstagedstr '%F{red}*%f'
zstyle ':vcs_info:git:*' stagedstr '%F{green}+%f'

precmd() { vcs_info }

zstyle ':vcs_info:git:*' formats '[%F{228}%b%u%c%%f]'
zstyle ':vcs_info:git:*' actionformats '%F{75}[%b|%a%u%c%f]'

setopt prompt_subst
PROMPT='${vcs_info_msg_0_} %~ %F{14}>%f '

## ls colors
export CLICOLOR=1
export LSCOLORS="Gxfxcxdxbxegedabagacad"

## aliases
alias ll='ls -alh'
alias la='ls -A'

alias cd..='cd ..'
alias cd...='cd ../..'
alias cd....='cd ../../..'
alias cd.....='cd ../../../..'
alias cd......='cd ../../../../..'

alias vi='nvim'

## golang settings
export GOPATH=$HOME/go
export GOROOT="$(brew --prefix golang)/libexec"
export PATH="$PATH:${GOPATH}/bin:${GOROOT}/bin"

## pyenv
eval "$(pyenv init -)"

