;;;  -*- lexical-binding: t; -*-
;;; dired-setup.el -- configurations for Dired
;;;

(use-package dired
  :ensure nil
  :config
  ;; Overwrite useless `list-directory' binding to call `dired' instead
  (keybind "C-x C-d" dired))
