;;;  -*- lexical-binding: t; -*-
;;; tramp-setup.el -- TRAMP configurations
;;;

(use-package tramp
  :init
  (customize-set-variable 'tramp-terminal-type "xterm-256color")
  :ensure t
  :config
  (setq
   remote-file-name-inhibit-cache nil
   vc-handled-backends '(Git)
   remote-file-name-inhibit-locks t
   enable-remote-dir-locals t
   tramp-completion-use-cache nil))

;; (add-to-list 'tramp-default-proxies-alist
;;              '("c.*\..*\.dev" nil "/podman:nflx-dev:%h:"))

(add-to-list 'tramp-connection-properties
             (list (regexp-quote "/podman:nflx-dev:")
                   "remote-shell" "/usr/bin/zsh"))


;; (add-to-list 'tramp-remote-process-environment "TERMINFO=''")
(setq tramp-remote-process-environment '("TERM=xterm-256color"))
;; (add-to-list 'tramp-remote-process-environment "TERM=xterm-256color")
(setq tramp-terminal-type "xterm-256color")
;; (setq tramp-remote-shell "")

(setq eat-term-name "xterm-256color")
;; (setq eat-term-terminfo-directory "/home/jake/terminfo")
;; (setq tramp-encoding-shell "/usr/bin/zsh")

(add-to-list 'eat-tramp-shells
	     '("ssh" . "/bin/sh"))

(add-to-list 'vterm-tramp-shells
             '("podman" login-shell))

;; (setq shell-file-name "/usr/bin/zsh")

(setq tramp-connection-local-default-shell-variables '((shell-file-name . "/bin/sh") (shell-command-switch . "-c")))

(defun async-shell-command-remote (host command)
  (interactive
   (list
    (read-directory-name "Target: ")
    (read-shell-command "Command: ")))
  (let ((default-directory host))
    (async-shell-command command)))

(keybind "C-M-&" async-shell-command-remote)
