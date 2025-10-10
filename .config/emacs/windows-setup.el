;;;  -*- lexical-binding: t; -*-
;;; windows-setup.el -- Window management
;;;

(defun split-window-below-and-focus ()
  (interactive)
  (split-window-below)
  (other-window 1))

(defun split-window-right-and-focus ()
  (interactive)
  (split-window-right)
  (other-window 1))

(use-package emacs
  :config
  (keybinds "M-<tab>" other-window
            "C-x 2" split-window-below-and-focus
	    "C-x 3" split-window-right-and-focus
	    "S-C-i" enlarge-window
	    "S-C-d" shrink-window))

(use-package ace-window
  :config
  (keybinds "C-z w" ace-window
	    "C-z C-w" ace-swap-window))
