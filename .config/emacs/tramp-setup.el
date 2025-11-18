;;;  -*- lexical-binding: t; -*-
;;; tramp-setup.el -- TRAMP configurations
;;;

(use-package tramp
  ;; :init
  ;; (customize-set-variable 'tramp-terminal-type "xterm-256color")
  :ensure t
  :config
  (setq
   remote-file-name-inhibit-cache nil
   vc-handled-backends '(Git)
   remote-file-name-inhibit-locks t
   tramp-use-scp-direct-remote-copying t
   remote-file-name-inhibit-auto-save-visited t
   tramp-use-connection-share nil
   enable-remote-dir-locals t
   tramp-histfile-override nil))

(setq tramp-default-method "rsync")

(setq tramp-copy-size-limit (* 1024 2048) ;; 2MB
      tramp-verbose 1)

(connection-local-set-profile-variables
 'remote-direct-async-process
 '((tramp-direct-async-process . t)))

;; (connection-local-set-profiles
;;  '(:application tramp :protocol "ssh")
;;  'remote-direct-async-process)

(connection-local-set-profiles
 '(:application tramp :protocol "scp")
 'remote-direct-async-process)

(connection-local-set-profiles
 '(:application tramp :protocol "rsync")
 'remote-direct-async-process)

(setq magit-tramp-pipe-stty-settings 'pty)

(with-eval-after-load 'tramp
  (with-eval-after-load 'compile
    (remove-hook 'compilation-mode-hook #'tramp-compile-disable-ssh-controlmaster-options)))

;; (add-to-list 'tramp-default-proxies-alist
;;              '("c.*\..*\.dev" nil "/podman:nflx-dev:%h:"))

(add-to-list 'tramp-connection-properties
             (list (regexp-quote "/podman:nflx-dev:")
                   "remote-shell" "/usr/bin/zsh"))

;; Prevent formatting errors over ssh.
(setq tramp-remote-process-environment '("TERM=xterm-256color"))

;; (add-to-list 'tramp-remote-process-environment "TERMINFO=''")
;; (setq tramp-terminal-type "xterm-256color")
;; (setq tramp-remote-shell "")
(setq eat-term-name "xterm-256color")
;; (setq eat-term-terminfo-directory "/home/jake/terminfo")
;; (setq tramp-encoding-shell "/usr/bin/zsh")

(add-to-list 'eat-tramp-shells
	     '("ssh" . "/bin/sh"))

;; (add-to-list 'eat-tramp-shells
;; 	     '("podman" . "/bin/sh"))
;; (add-to-list 'eat-tramp-shells
;; 	     '("podman" . "/usr/bin/zsh"))

;; Prevent formatting errors over podman.
(setq tramp-sh-extra-args '(("\\(?:\\`\\|/\\)bash\\'" . "-noediting -norc -noprofile")
			    ("\\(?:\\`\\|/\\)zsh\\'" . "-f +Z")))

(add-to-list 'vterm-tramp-shells
             '("podman" login-shell))

;; (setq shell-file-name "/usr/bin/zsh")

;; (setq tramp-connection-local-default-shell-variables '((shell-file-name . "/bin/sh") (shell-command-switch . "-c")))

;; XXX TODO add support for non-async commands.
(defun async-shell-command-remote (host command)
  (interactive
   (list
    (read-directory-name "Target: ")
    (read-shell-command "Async shell command: ")))
  (let ((default-directory host))
    (async-shell-command command)))

(keybind "C-M-&" async-shell-command-remote)
