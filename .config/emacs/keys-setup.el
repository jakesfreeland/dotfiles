;;;  -*- lexical-binding: t; -*-
;;; keys-setup.el -- Keybindings
;;;

;; Tweaks to default bindings:

(keybinds
 ; Better buffer menu
 "C-x C-b" ibuffer-other-window

 "C-v" View-scroll-half-page-forward
 "M-v" View-scroll-half-page-backward

 ; Overwrite useless `list-directory' binding to call `dired' instead
 "C-x C-d" dired

 ; Better yank-from-kill-ring
 "M-y" consult-yank-from-kill-ring

 ; Easy restart
 "C-x c" restart-emacs

 ; Easy window switch
 "C-<tab>" other-window

 ; (Remap tab switch)
 "C-S-<tab>" tab-next)

;; Custom bindings:

(keybinds
 "C-z 1" consult-todo
 "C-z 6" file-info-show
 "C-z =" edit-config
 "C-z C-a" incr-num-at-point
 "C-z C-x" decr-num-at-point
 "C-z SPC" consult-recent-file
 "C-z S-SPC" consult-recent-file-other-window
 "C-z )" ace-swap-window
 "C-z [" find-file-at-point
 "C-z b" consult-buffer
 "C-z c" copy-line
 "C-z d" gd
 "C-z f" toggle-frame-fullscreen
 "C-z g" consult-ripgrep
 "C-z h" hl-line-mode
 "C-z i" sp-change-inner
 "C-z k" kill-paragraph
 "C-z K" backward-kill-paragraph
 "C-z l" display-line-numbers-mode
 "C-z o" sp-change-enclosing
 "C-z p" package-list-packages
 "C-z q" logos-focus-mode
 "C-z s" consult-line
 "C-z t" ef-themes-select
 "C-z C-t" ef-themes-toggle
 "C-z v" view-mode
 "C-z w" whitespace-mode
 "C-z {" beginning-of-defun
 "C-z }" end-of-defun
 "C-z #" goto-line-num-at-point-in-recent-file
 "M-n" scroll-up-one
 "M-p" scroll-down-one
 "M-Q" xah-unfill-paragraph
 "M-[" backward-sexp
 "M-]" forward-sexp
 "C-z /" compile
 "C-z '" eldoc)

(with-eval-after-load 'view
  (define-key view-mode-map (kbd "j") 'next-line)
  (define-key view-mode-map (kbd "k") 'previous-line))
