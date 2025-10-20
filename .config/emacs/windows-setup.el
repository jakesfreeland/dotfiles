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

(defun switch-to-previous-window ()
  (interactive)
  (select-window (or (get-mru-window t t t)
                     (user-error "No previous window found"))))

(use-package emacs
  :config
  (keybinds "C-x 2" split-window-below-and-focus
	    "C-x 3" split-window-right-and-focus
	    "M-o" switch-to-previous-window
	    "S-C-i" enlarge-window
	    "S-C-d" shrink-window))

(use-package ace-window
  :config
  (keybinds "C-z w" ace-window
	    "C-z C-w" ace-swap-window))
