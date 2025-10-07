;;;  -*- lexical-binding: t; -*-
;;; mode-line-setup.el -- Mode-line configurations
;;;

(use-package diminish
  :demand t
  :config
  (diminish 'auto-revert-mode)
  (diminish 'eldoc-mode)
  (diminish 'undo-tree-mode)
  (diminish 'which-key-mode)
  (diminish 'yas-minor-mode))

