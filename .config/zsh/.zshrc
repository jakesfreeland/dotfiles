# os specific
os=$(uname)
if [ "$os" = "FreeBSD" ]; then
  prefix="/usr/local"
  alias up="doas pkg update && doas pkg upgrade -y"
elif [ "$os" = "Linux" ]; then
  prefix="/usr"
  alias up="doas dnf update -y && flatpak update -y"
fi

# command aliases
alias cp="cp -iv"
alias mv="mv -iv"
alias merge="rsync -aP"
alias trash="gio trash"

if command -v nvim > /dev/null 2>&1; then
  alias vim="nvim"
fi

# script aliases
alias spt="$HOME/.scripts/audio/spt.sh"

# keybinds
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

# history
HISTFILE="$HOME/.cache/zsh/history"
HISTSIZE=10000
SAVEHIST=10000

# prompt
autoload -U colors && colors
PS1="%B%{$fg[white]%}[%{$fg[magenta]%}%n%{$fg[white]%}@%{$fg[blue]%}%M %{$fg[yellow]%}%~%{$fg[white]%}]%{$fg[white]%}$%b "

# auto completion
autoload -Uz compinit && compinit && _comp_options+=(globdots)
zstyle ":completion:*" matcher-list "" "m:{a-zA-Z}={A-Za-z}"
zstyle ":completion:*" menu select

# vi mode
bindkey -v
bindkey "^?" backward-delete-char
export KEYTIMEOUT=1

# modal cursor
zle-line-init() {
    echo -ne "\e[5 q"
}
zle -N zle-line-init

zle-keymap-select() {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = "block" ]]; then
    echo -ne "\e[2 q"
  else
    echo -ne "\e[5 q"
  fi
}
zle -N zle-keymap-select

# zoxide (a smarter cd)
if command -v zoxide > /dev/null 2>&1; then
  eval "$(zoxide init zsh)"
  alias cd="z"
fi

# plugins
source ${prefix}/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
