;;;  -*- lexical-binding: t; -*-
;;; magit-setup.el -- Configurations for Magit
;;;

(use-package magit
  :defer t
  :config
  (keymap-set magit-section-mode-map
	      "C-<tab>" #'other-window)
  (keybind "C-x v c" magit-clone)
  (remove-hook 'magit-status-sections-hook 'magit-insert-tags-header)
  (remove-hook 'magit-status-sections-hook 'magit-insert-status-headers)
  (remove-hook 'magit-revision-sections-hook 'magit-insert-revision-headers))
