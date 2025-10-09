;;;  -*- lexical-binding: t; -*-
;;; lsp-setup.el -- Setup for Language Server Protocol integration
;;;

(use-package eglot
  :after orderless
  :init
  (setq eglot-autoshutdown t
	eglot-code-action-indications '(margin)
	completion-category-overrides '((eglot (styles orderless))
					(eglot-capf (styles orderless))))
  :hook
  ((c-mode . eglot-ensure)
   (c++-mode . eglot-ensure)
   (rust-mode . eglot-ensure)))

;; (use-package eglot-booster
;;   :after eglot
;;   :config
;;   (eglot-booster-mode))
