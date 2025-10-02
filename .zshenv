#!/bin/sh

# default programs
export BROWSER="chromium-browser"
export EDITOR="nvim"
export TERMINAL="alacritty"

# Cross Desktop Group (XDG)
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_SESSION_TYPE="x11"
export XDG_STATE_HOME="$HOME/.local/state"

# home cleanup
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export GNUPGHOME="$XDG_DATA_HOME/gnupg"
export GOPATH="$XDG_DATA_HOME/go"
export PASSWORD_STORE_DIR="$XDG_DATA_HOME/pass"
export RUSTUP_HOME="$XDG_DATA_HOME/rustup"
export XAUTHORITY="/tmp/.Xauthority"
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"

# miscellaneous
export CHROMIUM_USER_FLAGS="--enable-features=AcceleratedVideoDecodeLinuxGL"
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/openssh_agent"

# path
export PATH="$HOME/.local/bin:$CARGO_HOME/bin:$GOPATH/bin:$PATH"
