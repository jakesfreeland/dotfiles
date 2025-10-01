;;;  -*- lexical-binding: t; -*-
;;; ai-setup.el -- Setup for AI LLM integration
;;;

(use-package aider
  :config
  (global-set-key (kbd "C-c a") 'aider-transient-menu)
  (aider-magit-setup-transients)
  (global-auto-revert-mode 1)
  (auto-revert-mode 1))

;; (use-package copilot
;;   :config
;;   (setq copilot-max-char 10000000
;; 	copilot-chat-frontend 'org
;; 	copilot-chat-model 'gpt-4
;; 	copilot-indent-offset-warning-disable t))

;; (use-package copilot-chat)

;; (add-hook 'prog-mode-hook 'copilot-mode)
;; (define-key copilot-completion-map (kbd "<tab>") 'copilot-accept-completion)
;; (define-key copilot-completion-map (kbd "TAB") 'copilot-accept-completion)
