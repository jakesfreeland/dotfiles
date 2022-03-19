# aliases
alias up="doas dnf update -y && flatpak update -y"
alias cp="cp -iv"
alias mv="mv -iv"
alias merge="rsync -aP"
alias cd="z"
alias trash="gio trash"
alias vim="nvim"
alias c="clear"
alias spt="$HOME/.scripts/audio/spt.sh"
alias ethmine="$HOME/.scripts/mining/ethermine.sh"
alias gputemp="$HOME/.scripts/mining/gputemp.sh"

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
eval "$(zoxide init zsh)"

# plugins
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
