# Preferences
alias vb='vim ~/.bashrc'
alias sb='source ~/.bashrc'
alias vba='vim ~/.bash_aliases'

alias vc='vim ~/.vimrc'

alias tc='vim ~/.tmux.conf'
alias st='tmux source-file ~/.tmux.conf'

alias ve='vim ~/.emacs'
alias ee='emacs ~/.emacs'


# File System Navigation
alias ll='ls -lhXv --hide=*.class'
alias la='ls -A'
alias lla='ll -A'
alias l='ll'

alias ppd='popd'
alias pd=pushd $1
alias bd='cd -'
alias ..='cd ..'

alias c='clear'
alias x='exit'
alias tm='tmux'

alias mkdir='mkdir -m u=rwx,g=r,o=r'


# # runnables
alias py='python'
alias py3='python3'
#alias killpy='killall python'
#alias open='nautilus $1 &>/dev/null'
#alias term='gnome-terminal'
#alias sysmon='gnome-system-monitor & disown'
#alias off='shutdown now'
#alias fan="sudo ~/scripts/_fan $1"
alias mk='make'
alias km='make'
alias mkr='make && echo "" && ./run'
alias mkc='make clean'
alias vs='vim -S'
alias chrome='google-chrome-stable &> /dev/null & disown'


# # git
alias gs='git status'
alias gl='git log'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias gd='git diff'
alias gf='git fetch origin'
alias gr='cd $(git rev-parse --show-toplevel)'


# # colors
export NO_COLOR='\e[0m'
export WHITE='\e[1;37m'
export BLACK='\e[0;30m'
export BLUE='\e[0;34m'
export LIGHT_BLUE='\e[1;34m'
export GREEN='\e[0;32m'
export LIGHT_GREEN='\e[1;32m'
export CYAN='\e[0;36m'
export LIGHT_CYAN='\e[1;36m'
export RED='\e[0;31m'
export LIGHT_RED='\e[1;31m'
export PURPLE='\e[0;35m'
export LIGHT_PURPLE='\e[1;35m'
export BROWN='\e[0;33m'
export YELLOW='\e[1;33m'
export GRAY='\e[0;30m'
export LIGHT_GRAY='\e[0;37m'

function color {
    echo -ne $1
    ${@:2}
    echo -ne $NO_COLOR
}


# # SEASNET SERVER
export LNX="vivekk@lnxsrv09.seas.ucla.edu"
export EEAPPS="vivekk@eeapps.seas.ucla.edu"

# # DISPLAY
export DISPLAY=$(awk '/nameserver / {print $2; exit}' /etc/resolv.conf 2>/dev/null):0
export LIBGL_ALWAYS_INDIRECT=1

# # Windows Clipboard Access
alias clip='clip.exe'
alias paste='powershell.exe Get-Clipboard'
