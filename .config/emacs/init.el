;; --- APPEARANCE ---
(setq inhibit-startup-message 1)
(menu-bar-mode 0)
(tool-bar-mode 0)
(toggle-scroll-bar 0)
(global-display-line-numbers-mode 1)
(set-face-attribute 'default nil :font "Source Code Pro Semibold" :height 160)
(setq-default tab-width 2)

;; --- FUNCTIONALITY ---
(ido-mode 1)
(toggle-truncate-lines 1)

;; --- BACKUP ---
(setq
 backup-by-copying 1
 backup-directory-alist '(("." . "~/.cache/emacs/backup/"))
 delete-old-versions 1
 kept-new-versions 4
 kept-old-versions 2
 version-control 1)

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

;; which-key
(which-key-mode 1)

;; evil
(require 'evil)
(evil-mode 1)

;; smartparens
(require 'smartparens-config)
(smartparens-global-mode 1)

;; lsp-mode and lsp-ui
(require 'lsp-mode)
(add-hook 'c-mode-hook #'lsp)
(add-hook 'rust-mode-hook #'lsp)

