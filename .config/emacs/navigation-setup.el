;;;  -*- lexical-binding: t; -*-
;;; navigation-setup.el -- Ways to get around
;;;

(use-package expand-region
  :bind ("C-=" . er/expand-region))

(defun scroll-up-one ()
  (interactive)
  (scroll-up-command 1))

(defun scroll-down-one ()
  (interactive)
  (scroll-down-command 1))

(keybinds
 "M-n" scroll-up-one
 "M-p" scroll-down-one)

(use-package view
  :config
  (keybinds "C-v" View-scroll-half-page-forward
            "M-v" View-scroll-half-page-backward))
