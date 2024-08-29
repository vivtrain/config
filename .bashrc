# ~/.bashrc: executed by bash(1) for non-login shells.
# See /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

### Inital Settings ############################################################
# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# Set the localization settings for languages, text-rendering, sort order, etc.
#export LC_ALL='C'
#export LANG='C'

# check if path has been updated so it doesn't grow with new terminals
if ! grep -q "$PATH" <<< "/usr/bin"; then
    export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:\
        /snap/bin:/usr/games:/home/k99vivek/.local/bin:/opt/nvim-linux64/bin:$PATH"
fi
export CDPATH='.'
export LESS='-R'

# Vim as default editor
EDITOR=/usr/bin/vim

# Vi-like line editing on the command line
set -o vi
# Use physical directories for cd instead of symbolic links
set -o physical
# Disable overwriting of files via redirection
set -o noclobber

# # History # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
HISTCONTROL=ignoreboth      # no duplicate lines or lines starting with space
shopt -s histappend         # append to the history file instead of overwriting
HISTSIZE=1000
HISTFILESIZE=2000
shopt -s checkwinsize       # update window size

# # The Prompt # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# Set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# Set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

### Colors #####################################################################
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
    # We have color support; assume it's compliant with Ecma-48
    # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
    # a case would tend to support setf rather than setaf.)
    color_prompt=yes
    else
    color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
    export TERM=xterm-256color
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi

# Set custom terminal capabilities (termcap)
if [ "$color_prompt" = yes ]; then
  export LESS_TERMCAP_mb=$'\e[94m'     # mode blink
  export LESS_TERMCAP_md=$'\e[94m'     # mode bold
  export LESS_TERMCAP_me=$'\e[0m'      # mode end
  export LESS_TERMCAP_so=$'\e[30;103m'  # standout
  export LESS_TERMCAP_se=$'\e[0m'      # standout end
  export LESS_TERMCAP_us=$'\e[32m'     # underline start
  export LESS_TERMCAP_ue=$'\e[0m'      # underline end
fi

unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --group-directories-first --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
 export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

### Other Sources ##############################################################
# Alias definitions.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

if [ -f ~/.inputrc ]; then
    bind -f ~/.inputrc
fi

# Miscellaneous preferences.
if [ -f ~/.bash_preferences ]; then
    . ~/.bash_preferences
fi

### Miscellaneous ##############################################################

# Enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Add an "alert" alias for long running commands.
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Start tmux by default if available
if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
    tmux new
fi

# Set the environment variable for X11 via Xming on Windows WSL
if [ -n $(uname -r | grep -i microsoft) ]; then
  export DISPLAY=$(awk '/nameserver/ {print $2}' < /etc/resolv.conf):0.0
fi

# Use oh-my-posh if available
if command -v oh-my-posh &> /dev/null; then
  eval "$(oh-my-posh init bash --config ~/.wtTheme.omp.json)"
fi

export NVM_DIR="$HOME/.nvm"
# Source these scripts to use the nvm command properly
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
#[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

