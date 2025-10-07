;;;  -*- lexical-binding: t; -*-
;;; tramp-setup.el -- TRAMP configurations
;;;

(use-package tramp
  :ensure t
  :config
  (setq
   remote-file-name-inhibit-cache nil
   vc-handled-backends '(Git)
   remote-file-name-inhibit-locks t))

;; (add-to-list 'tramp-default-proxies-alist
;;              '("c.*\..*\.dev" nil "/podman:nflx-dev:%h:"))

(add-to-list 'tramp-connection-properties
             (list (regexp-quote "/podman:nflx-dev:")
                   "remote-shell" "/usr/bin/zsh"))

;; (add-to-list 'tramp-remote-process-environment "TERM=xterm-256color")
;; (add-to-list 'tramp-remote-process-environment "TERMINFO=''")

(add-to-list 'vterm-tramp-shells
             '("podman" login-shell))
