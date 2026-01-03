;;;  -*- lexical-binding: t; -*-
;;; ai-setup.el -- Setup for AI LLM integration
;;;

(use-package aider
  :config
  (keybind "C-c a" aider-transient-menu))

(use-package claudemacs
  :vc (:url "https://github.com/cpoile/claudemacs" :rev :newest)
  :config
  (keybind "C-c c" claudemacs-transient-menu))

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
