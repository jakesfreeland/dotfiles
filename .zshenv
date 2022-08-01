#!/bin/sh

# default programs
export EDITOR="nvim"
export BROWSER="chrome"
export TERMINAL="alacritty"

# Cross Desktop Group (XDG)
export XDG_SESSION_TYPE="x11"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

# home cleanup
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc-2.0"
export WGETRC="$XDG_CONFIG_HOME/wget/wgetrc"
export CCACHE_DIR="$XDG_CACHE_HOME/ccache"
export XAUTHORITY="/tmp/.Xauthority"
export LESSKEY="$XDG_CONFIG_HOME/less/lesskey"
export LESSHISTFILE="/dev/null"
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export GNUPGHOME="$XDG_DATA_HOME/gnupg"
export TEXMFVAR="$XDG_CACHE_HOME/texlive/texmf-var"
export PASSWORD_STORE_DIR="$XDG_DATA_HOME/pass"

# path
export PATH="$CARGO_HOME/bin:$PATH"

