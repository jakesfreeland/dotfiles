;;;  -*- lexical-binding: t; -*-
;;; c-family-setup.el -- Configurations for C-like languages
;;;

(add-hook 'c-mode-common-hook
	  (=> (c-set-style "bsd")
	      (display-line-numbers-mode)))
