;;;  -*- lexical-binding: t; -*-
;;; package-setup.el -- Package management initialization
;;;

(require 'package)

(add-to-list 'package-archives
             '("melpa" .
	       "https://melpa.org/packages/"))

(keybind "C-z p" package-list-packages)

(setq package-install-upgrade-builtin t)

(package-initialize)

(setq use-package-always-ensure t)
