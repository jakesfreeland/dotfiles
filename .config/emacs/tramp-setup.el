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

;(add-to-list 'tramp-default-proxies-alist
;            '("c.*\..*\.dev" nil "/podman:zen_ritchie:%h:"))
