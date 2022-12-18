#!/bin/sh

# default programs
export BROWSER="chromium-freeworld"
export EDITOR="vim"
export TERMINAL="alacritty"

# Cross Desktop Group (XDG)
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_SESSION_TYPE="x11"
export XDG_STATE_HOME="$HOME/.local/state"

# home cleanup
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export CCACHE_DIR="$XDG_CACHE_HOME/ccache"
export GNUPGHOME="$XDG_DATA_HOME/gnupg"
export GOPATH="$XDG_DATA_HOME/go"
export LESSHISTFILE="/dev/null"
export LESSKEY="$XDG_CONFIG_HOME/less/lesskey"
export PASSWORD_STORE_DIR="$XDG_DATA_HOME/pass"
export RUSTUP_HOME="$XDG_DATA_HOME/rustup"
export TEXMFVAR="$XDG_CACHE_HOME/texlive/texmf-var"
export XAUTHORITY="/tmp/.Xauthority"
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"

# path
export PATH="$CARGO_HOME/bin:$GOPATH/bin:$PATH"
