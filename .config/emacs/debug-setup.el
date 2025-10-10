;;;  -*- lexical-binding: t; -*-
;;; debug-setup.el -- Setup for Debug Adapter Protocol integration
;;;

(use-package dape
  :preface
  (setq dape-key-prefix (kbd "C-x C-a")
	dape-debug t)

  :custom
  (dape-breakpoint-global-mode +1)
  (dape-buffer-window-arrangement 'gud)
  ;; (dape-info-hide-mode-line nil)

  :config
  (add-hook 'dape-display-source-hook #'pulse-momentary-highlight-one-line)
  ;; Save buffers on startup, useful for interpreted languages
  (add-hook 'dape-start-hook (lambda () (save-some-buffers t t))))
