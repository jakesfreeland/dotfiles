;;;  -*- lexical-binding: t; -*-
;;; buffers-setup.el -- Window management
;;;

(use-package emacs
  :config
  ;; Easy window switch
  (keybinds "C-<tab>" other-window
            "S-C-i" enlarge-window
            "S-C-d" shrink-window))

(use-package ace-window
  :config
  (keybind "C-z )" ace-swap-window))
