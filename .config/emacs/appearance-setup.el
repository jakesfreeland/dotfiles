;;;  -*- lexical-binding: t; -*-
;;; appearance-setup.el -- Configurations for how Emacs looks
;;;

;; Use the wonderful ef-themes
(use-package ef-themes
  :config
  (setq ef-melissa-dark-palette-overrides
        '((prompt yellow-warmer))
	ef-dream-palette-overrides
	'((prose-done green-warmer)))
  (when-mac (setq ef-themes-to-toggle
		  '(ef-day ef-autumn))))

(require-theme 'ef-themes)

(use-package doric-themes)

(require-theme 'doric-themes)

(when-mac (load-theme 'ef-autumn t))
(when-linux (load-theme 'ef-winter t))

;; Bigger font
(when-mac (set-face-attribute 'default nil :height 200))
(when-linux (set-face-attribute 'default nil :height 120))

;; Use the wonderful "Aporetic" font
(when-mac (set-face-attribute 'default nil :family "Aporetic Sans Mono"))
(when-linux (set-face-attribute 'default nil :family "Source Code Pro" :weight 'semibold))

;; Truncate long lines (wrapping causes too much visual interference)
(set-default 'truncate-lines t)

;; Smooth scrolling
(pixel-scroll-precision-mode 1)
