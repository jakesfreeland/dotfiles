;;;  -*- lexical-binding: t; -*-
;;; appearance-setup.el -- Configurations for how Emacs looks
;;;

(use-package view)

;; Use the wonderful ef-themes
(use-package ef-themes
  :config
  (setq ef-melissa-dark-palette-overrides
        '((prompt yellow-warmer))
	ef-dream-palette-overrides
	'((prose-done green-warmer)))

  (keybinds
   "C-z t" ef-themes-select
   "C-z C-t" ef-themes-toggle)

  (when-mac (setq ef-themes-to-toggle
		  '(ef-day ef-symbiosis))))

(require-theme 'ef-themes)

(use-package doric-themes)

(require-theme 'doric-themes)

(when-mac (load-theme 'ef-symbiosis t))
(when-linux (load-theme 'ef-winter t))

;; Bigger font
(when-mac (set-face-attribute 'default nil :height 200))
(when-linux (set-face-attribute 'default nil :height 110))

;; Easy command to change font size
(defun set-font-height-in-pts (pts)
  (set-face-attribute 'default nil :height (* 10 pts)))

(defun change-font-size ()
  (interactive)
  (let* ((common-sizes
	  (mapcar #'number-to-string '(8 10 12 14 16 18 20)))
	 (size-in-pts
	  (completing-read "Enter the new font size in pts: " common-sizes)))
    (set-font-height-in-pts (string-to-number size-in-pts))))

;; Use the wonderful "Aporetic" font
(when-mac (set-face-attribute 'default nil :family "Aporetic Sans Mono"))
(when-linux (set-face-attribute 'default nil :family "Source Code Pro" :weight 'semibold))

;; Spacious padding
(use-package spacious-padding
  :init (setq spacious-padding-subtle-mode-line nil)
  :hook ((after-init . spacious-padding-mode)
	 (server-after-make-frame . spacious-padding-mode)))

;; Truncate long lines (wrapping causes too much visual interference)
(set-default 'truncate-lines t)

;; Smooth scrolling
(pixel-scroll-precision-mode 1)
