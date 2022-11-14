;; emacs initialization file

;; appearance
(set-default 'truncate-lines t)
(set-face-attribute 'default nil :font "Source Code Pro Semibold" :height 160)

;; options
(setq inhibit-startup-message t)
(setq completion-ignore-case t)
(setq read-buffer-completion-ignore-case t)

;; backup and undo
(setq
 backup-by-copying t
 backup-directory-alist '(("." . "~/.cache/emacs/backup/"))
 undo-tree-history-directory-alist '(("." . "~/.emacs.d/undo"))
 delete-old-versions t
 kept-new-versions 4
 kept-old-versions 2
 version-control t)

;; emacs modes
(global-display-line-numbers-mode 1)
(scroll-bar-mode 0)
(size-indication-mode 0)
(column-number-mode 1)
(electric-pair-mode 1)
(global-auto-revert-mode 1)
(recentf-mode 1)
(savehist-mode 1)
(show-paren-mode 1)

;; plugin modes
(vertico-mode 1)
(which-key-mode 1)

;; --- PACKAGING ---
(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

;; --- PACKAGES ---
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(lsp-ui lsp-mode evil smartparens which-key dracula-theme)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; dracula-theme
(load-theme 'dracula 1)

;; lsp-mode and lsp-ui
(require 'lsp-mode)
(add-hook 'c-mode-hook #'lsp)
(add-hook 'rust-mode-hook #'lsp)

