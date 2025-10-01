;;;  -*- lexical-binding: t; -*-
;;; builtin-options-setup.el -- Settings for builtin options
;;;

(defconst
  metadata-dir
  (substitute-in-file-name "$XDG_CACHE_HOME/emacs"))

(setq
 auto-save-file-name-transforms `((".*" ,metadata-dir t))
 backup-by-copying t
 backup-directory-alist `(("." . ,metadata-dir))
 bookmark-save-flag 1
 custom-file (locate-user-emacs-file "custom-vars.el")
 delete-old-versions t
 dired-kill-when-opening-new-dired-buffer t
 display-time-day-and-date nil
 display-time-default-load-average nil
 eshell-hitory-size 1024
 gc-cons-threshold 20000000
 global-auto-revert-non-file-buffers t
 grep-use-headings t
 inhibit-startup-screen t
 initial-buffer-choice t
 initial-scratch-message ";; Scratch\n\n"
 kept-new-versions 6
 kept-old-versions 2
 make-pointer-invisible t
 recentf-max-saved-items 500
 ring-bell-function 'ignore
 sentence-end-double-space t
 set-mark-command-repeat-pop t
 scroll-preserve-screen-position t
 tab-bar-show 1
 undo-tree-history-directory-alist `(("." . ,metadata-dir))
 use-dialog-box nil
 version-control t
 window-combination-resize t)

(when-mac
 (setq
  confirm-kill-emacs (lambda (prompt) (yes-or-no-p "Quit?"))))

(setq
 native-comp-async-report-warnings-errors 'silent
 native-compile-prune-cache t)
