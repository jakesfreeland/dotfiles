;;;  -*- lexical-binding: t; -*-
;;; package-setup.el -- Package management
;;;

(require 'package)

(add-to-list 'package-archives
             '("melpa-stable" .
	       "https://stable.melpa.org/packages/"))

(setq package-install-upgrade-builtin t)

(package-initialize)

(setq use-package-always-ensure t)

(use-package consult
  :demand t
  :config
  (setq register-preview-delay 0.8
        register-preview-function #'consult-register-format))

(use-package magit
  :defer t
  :init
  (setq native-comp-enable-subr-trampolines nil)
  :config
  (keymap-set magit-section-mode-map "C-<tab>" #'other-window))

(use-package expand-region
  :bind ("C-=" . er/expand-region))

(use-package marginalia
  :config
  (marginalia-mode 1))

(use-package multiple-cursors
  :bind (("C-<" . mc/mmlte--up)
	 ("C->" . mc/mmlte--down)
	 ("C-M->" . mc/mark-next-like-this)
	 ("C-M-<" . mc/mark-previous-like-this)
	 ("C-c C->" . mc/mark-all-dwim)))

(use-package spacious-padding
  :init (setq spacious-padding-subtle-mode-line nil)
  :hook ((after-init . spacious-padding-mode)
        (server-after-make-frame . spacious-padding-mode)))

(use-package undo-tree
  :config
  (setq undo-tree-history-directory-alist `(("." . ,metadata-dir))))

(use-package vertico
  :config
  (vertico-mode 1))

(use-package vertico-directory
  :after vertico
  :ensure nil
  :bind (:map vertico-map
              ("M-DEL" . vertico-directory-delete-word))
  :hook (rfn-eshadow-update-overlay . vertico-directory-tidy))

(use-package view)

(use-package which-key
  :config
  (which-key-mode 1))

(use-package windresize)
