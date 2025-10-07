;;;  -*- lexical-binding: t; -*-
;;; terminal-setup.el -- Setup for (multiple) terminals
;;;

;; Use the excellent `vterm' terminal emulator. Fetch it from Github
;; since it's not on `melpa-stable'.
(use-package vterm
  :demand t
  :vc (:url "https://github.com/akermu/emacs-libvterm"
	    :rev :newest)
  :config
  (setq vterm-timer-delay nil
	vterm-max-scrollback 10000)
  (define-key vterm-mode-map (kbd "M-y") #'vterm-yank-pop)
  (define-key vterm-mode-map (kbd "C-z") nil)
  (define-key vterm-mode-map (kbd "C-z C-z") #'vterm--self-insert))

;; Some helper functions that will be used in the definitions of the
;; key-bound vterm spawning function:

(defun collapse-tilde (path)
  "Un-expand the `~' character in a path, i.e. `string-replace' the full
home directory path with a `~/'."
  (string-replace (expand-file-name "~/") "~/" path))

(defun cwd ()
  "Get the current working directory. Implemented as `pwd' with the
returned string cleaned up."
  (let ((inhibit-message t))
    (mapconcat #'identity
	       (cdr (split-string
		     (collapse-tilde (pwd))
		     " "))
	       " ")))

(defun buffer-names-matching-regexp (regexp)
  "Return a list of buffers whose names match `regexp'."
  (require 'cl-lib)
  (cl-remove-if-not
   (lambda (buf-name)
     (string-match-p regexp buf-name))
   (mapcar #'buffer-name (buffer-list))))

(defun vterm-session/go (dir &optional force-new)
  "Go to a `vterm' session for the directory DIR. If a session already
exists for DIR, jump to it; else, create a new vterm instance in DIR.

If FORCE-NEW is `t', then a new session will be created unconditionally
(even if one already exists for DIR)."
  (let ((vterm-buf-name (concat "*vterm* " dir)))
    (if (and (get-buffer vterm-buf-name) (not force-new))
	(pop-to-buffer vterm-buf-name)
      (let ((default-directory dir))
	(vterm vterm-buf-name)))))

;; Now the main event: wrappers around `vterm' which enable:
;; - creating new sessions with descriptive names
;;   (`vterm-session/create-*')
;; - switching to existsing sessions by way of a completion menu
;;   (`vterm-session/select')

(defun vterm-session/create-in-current-directory (arg)
  "Create or jump to a new `vterm' session in the current directory
(that from which this command was executed). If one already exists there,
then jump to it, else create a new session and name the buffer after
the current directory.

If a prefix argument is passed, then a new session will be created
unconditionally (even if one already exists for the current directory)."
  (interactive "P")
  (let ((current-directory (cwd)))
    (vterm-session/go current-directory arg)))

(defun vterm-session/create-in-chosen-directory (arg)
  "Prompt for a directory in which to create a new, or jump to an existing,
`vterm' session.

If a prefix argument is passed, then a new session will be created
unconditionally."
  (interactive "P")
  (let ((dir (read-directory-name "Open vterm in: ")))
    (if dir
        (vterm-session/go dir arg))))

(defun vterm-session/select (arg)
  "Provide a completion menu of all active `vterm' sessions (whose names
match the format used by `vterm-create'), and jump to the selected
candidate.

If a prefix argument is passed, then the jump will happen in the current
window, instead of popping to another window"
  (interactive "P")
  (let ((vterm-buffer-names (buffer-names-matching-regexp "\*vterm\*")))
    (if (not vterm-buffer-names)
	(message "No vterm sessions to choose from.")
      (let ((buf-name (completing-read
		       "Select vterm session: " vterm-buffer-names)))
	(if arg
	    (switch-to-buffer buf-name)
	  (pop-to-buffer buf-name
			 #'display-buffer-use-least-recent-window))))))

; ---

(use-package eat
  :config
  (define-key eat-semi-char-mode-map (kbd "C-z") nil)
  (define-key eat-semi-char-mode-map (kbd "C-z C-z") #'eat-self-input))

(defun eat-session/go (dir &optional force-new)
  "Go to a `eat' session for the directory DIR. If a session already
exists for DIR, jump to it; else, create a new eat instance in DIR.

If FORCE-NEW is `t', then a new session will be created unconditionally
(even if one already exists for DIR)."
  (let ((eat-buf-name (concat "*eat* " dir)))
    (if (and (get-buffer eat-buf-name) (not force-new))
	(pop-to-buffer eat-buf-name)
      (let ((default-directory dir))
	(eat)))))

;; Now the main event: wrappers around `eat' which enable:
;; - creating new sessions with descriptive names
;;   (`eat-session/create-*')
;; - switching to existsing sessions by way of a completion menu
;;   (`eat-session/select')

(defun eat-session/create-in-current-directory (arg)
  "Create or jump to a new `eat' session in the current directory
(that from which this command was executed). If one already exists there,
then jump to it, else create a new session and name the buffer after
the current directory.

If a prefix argument is passed, then a new session will be created
unconditionally (even if one already exists for the current directory)."
  (interactive "P")
  (let ((current-directory (cwd)))
    (eat-session/go current-directory arg)))

(defun eat-session/create-in-chosen-directory (arg)
  "Prompt for a directory in which to create a new, or jump to an existing,
`eat' session.

If a prefix argument is passed, then a new session will be created
unconditionally."
  (interactive "P")
  (let ((dir (read-directory-name "Open eat in: ")))
    (if dir
        (eat-session/go dir arg))))

(keybinds
 "C-z ." vterm-session/create-in-current-directory
 "C-z ," vterm-session/create-in-chosen-directory
 "C-z /" vterm-session/select)
