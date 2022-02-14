#!/bin/sh

# default programs
export EDITOR="nvim"
export BROWSER="google-chrome"
export TERMINAL="alacritty"

# home cleanup
export ZDOTDIR="$HOME/.config/zsh"
export GTK2_RC_FILES="$HOME/.config/gtk-2.0/gtkrc-2.0"
export WGETRC="$HOME/.config/wget/wgetrc"
export CCACHE_DIR="$HOME/.cache/ccache"
export CUDA_CACHE_PATH="$HOME/.cache/nv"
export XAUTHORITY="$XDG_RUNTIME_DIR/Xauthority"
export LESSKEY="$HOME/.config/less/lesskey"
export LESSHISTFILE="/dev/null"

# theming
export QT_QPA_PLATFORMTHEME="qt5ct"
export GTK_THEME_VARIANT="dark"
