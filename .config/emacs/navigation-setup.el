;;;  -*- lexical-binding: t; -*-
;;; navigation-setup.el -- Ways to get around
;;;

(use-package expand-region
  :bind ("C-=" . er/expand-region))

(keybinds
 "M-n" next-line
 "M-p" previous-line)

(use-package god-mode
  :init
  (setq god-mode-enable-function-key-translation nil)
  (keybind "<escape>" #'god-mode)
  (add-to-list 'god-exempt-major-modes 'vterm-mode))

(use-package view
  :config
  (keybinds "C-v" View-scroll-half-page-forward
            "M-v" View-scroll-half-page-backward))
