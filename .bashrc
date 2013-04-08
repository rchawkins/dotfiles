# .bashrc

################################################################################
## Path
################################################################################

dirs="
/bin
/sbin
/usr/bin
/usr/sbin
/usr/local/bin
~/bin
"

for dir in $dirs; do
    if [[ -d "$dir" ]] && [[ ":${PATH}:" != *":${dir}:"* ]]; then
        if [[ -n "$PATH" ]]; then
            PATH="${dir}:${PATH}"
        else
            PATH=$dir
        fi
    fi
done

################################################################################
## Prompt
################################################################################

# good examples here: https://github.com/tejr/dotfiles/blob/master/bash/bashrc

color_reset='\[\033[0m\]'
color_red='\[\033[0;31m\]'
color_green='\[\033[0;32m\]'
color_yellow='\[\033[0;33m\]'
color_byellow='\[\033[1;33m\]'
color_blue='\[\033[0;34m\]'
color_lblue='\[\033[0;36m\]'
color_grey='\[\033[0;37m\]'
color_dgrey='\[\033[1;30m\]'

prompt() {
    color_user=${color_blue}
    [[ $UID == 0 ]] && color_user=${color_red}

    PS1="${color_grey}[ \t ][ ${color_user}\u${color_dgrey}@${color_grey}\h${color_dgrey}:${color_yellow}${color_yellow}\w ${color_grey}]\n${color_byellow}\$ ${color_reset} "
}
prompt_off() {
    PS1='\u@\h\$ '
}

prompt

################################################################################
## Aliases
################################################################################

alias bashrc="source ~/.bashrc"

if [[ $(uname) = "Darwin" ]]; then
    alias ls='ls -G'
else
    alias ls='ls --color=auto'
fi

alias e='emacs -nw'

alias ll='ls -alh'
alias lt='ls -larth'

alias h='history'

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'


################################################################################
## Options
################################################################################

HISTFILESIZE=1000000
HISTSIZE=1000000

# Ignore duplicate commands and whitespace in history.
HISTCONTROL=ignoreboth

# Keep the times of the commands in history.
HISTTIMEFORMAT='%F %T  '

# Append rather than overwrite Bash history.
shopt -s histappend &>/dev/null

# Put multi-line commands onto one line of history.
shopt -s cmdhist &>/dev/null


################################################################################
## Misc
################################################################################

# enable color support of ls
if [ -x /usr/bin/dircolors ]; then
    eval "$(dircolors -b)"
fi

# source local bashrc if it exists
if [[ -e "$HOME/.bashrc.local" ]]; then
    source "$HOME/.bashrc.local"
fi
