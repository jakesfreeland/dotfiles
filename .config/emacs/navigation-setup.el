;;;  -*- lexical-binding: t; -*-
;;; navigation-setup.el -- Ways to get around
;;;

(use-package expand-region
  :bind ("C-=" . er/expand-region))

(defun backward-whitespace (arg)
  (interactive "^p")
  (forward-whitespace (- arg)))

(keybinds
 "M-n" next-line
 "M-p" previous-line
 "M-f" forward-whitespace
 "M-b" backward-whitespace
 "M-C-f" forward-word
 "M-C-b" backward-word)

(use-package god-mode
  :config
  (setq god-mode-enable-function-key-translation nil)
  (keybind "<escape>" #'god-mode)
  (add-to-list 'god-exempt-major-modes 'vterm-mode)
  (add-to-list 'god-exempt-major-modes 'eat-semi-char-mode))

(use-package view
  :config
  (keybinds "C-v" View-scroll-half-page-forward
            "M-v" View-scroll-half-page-backward))
