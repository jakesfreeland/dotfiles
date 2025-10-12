# os specific
os=$(uname)
if [ "$os" = "FreeBSD" ]; then
  prefix="/usr/local"
  alias up="doas pkg update && doas pkg upgrade -y"
elif [ "$os" = "Linux" ]; then
  prefix="/usr"
  alias up="doas dnf update -y && flatpak update -y"
elif [ "$os" = "Darwin" ]; then
  prefix="/opt/pkg"
  alias up="doas pkgin update -y && doas pkgin upgrade -y"
fi

# command aliases
alias cp="cp -iv"
alias mv="mv -iv"
alias merge="rsync -aP"
alias trash="gio trash"
alias nvpn="systemctl restart openvpn-client@netflix.service"

if command -v xdg-open > /dev/null 2>&1; then
  alias open="xdg-open"
fi

if command -v nvim > /dev/null 2>&1; then
  alias vi="nvim"
fi


# history
[ -f "${XDG_CACHE_HOME}/zsh" ] || mkdir -p "${XDG_CACHE_HOME}/zsh"
HISTFILE="${XDG_CACHE_HOME}/zsh/history"
HISTSIZE=10000
SAVEHIST=10000

# prompt
autoload -U colors && colors
PS1="%B%{$fg[white]%}[%{$fg[magenta]%}%n%{$fg[white]%}@%{$fg[blue]%}%M %{$fg[yellow]%}%~%{$fg[white]%}]%{$fg[white]%}$%b "

# auto completion
autoload -Uz compinit && compinit
zstyle ":completion:*" matcher-list "" "m:{a-zA-Z}={A-Za-z}"
zstyle ":completion:*" menu select
zstyle ':completion:*' completer _expand_alias _complete _ignored

# allow glob operators
setopt extended_glob

# emacs mode
bindkey -e

# zoxide (a smarter cd)
if command -v zoxide > /dev/null 2>&1; then
  eval "$(zoxide init zsh)"
  alias cd="z"
fi

# plugins
source ${prefix}/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Emacs vterm support
vterm_conf="${XDG_CONFIG_HOME}/emacs/elpa/vterm/etc/emacs-vterm-zsh.sh"
[ -f "${vterm_conf}" ] && source "${vterm_conf}"
