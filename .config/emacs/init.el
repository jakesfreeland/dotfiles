;;;  -*- lexical-binding: t; -*-
;;; init.el -- Emacs startup file
;;;

(defun load-these (files)
  (mapcar
   (lambda (file)
     (load-file (locate-user-emacs-file file)))
   files))

(load-these '("setup-setup.el"

	      ;; * Packages
	      "package-setup.el"
	      ;; ^ load this early so that later files
	      ;;   are set up to declare dependencies.

	      ;; * Basics
	      ;; "basics-setup.el"

	      ;; * Navigation
	      "navigation-setup.el"

	      ;; * Editing
	      "editing-setup.el"

	      ;; * Copying and Pasting
	      ;;  (Killing and Yanking)
	      "copy-paste-setup.el"

	      ;; * Appearance
	      "appearance-setup.el"

	      ;; * Visuals
	      ;; "visuals-setup.el"

	      ;; * Builtins
	      "builtin-modes-setup.el"
	      "builtin-options-setup.el"
	      ;; "path-setup.el"
	      "dired-setup.el"

	      ;; * Buffers
	      ;; "buffers-setup.el"

	      ;; * Windows
	      "windows-setup.el"

	      ;; * Tabs
	      "tabs-setup.el"

	      ;; * Completion
	      "completion-setup.el"

	      ;; * Email
	      ;; "mail-setup.el"

	      ;; * Terminal
	      "terminal-setup.el"

	      ;; * Shell
	      ;; "shell-setup.el"

	      ;; * Tramp
	      "tramp-setup.el"

	      ;; * Languages
	      ;; * * natural
	      ;; "plaintext-setup.el"
	      ;; "writing-setup.el"
	      ;; "notes-setup.el"
	      ;; "poem-setup.el"

	      ;; * * markup
	      ;; "markdown-setup.el"
	      ;; "org-setup.el"
	      ;; "lilypond-setup.el"

	      ;; * * plaintext data
	      ;; "csv-setup.el"

	      ;; * * programming
	      ;; "programming-setup.el"
	      "documentation-setup.el"
	      "tree-sitter-setup.el"
	      "c-family-setup.el"
	      ;; "d-setup.el"
	      ;; "elisp-setup.el"
	      ;; "haskell-setup.el"
	      ;; "html-setup.el"
	      ;; "js-setup.el"
	      ;; "lisp-setup.el"
	      "lsp-setup.el"
	      ;; "ocaml-setup.el"
	      ;; "python-setup.el"

	      ;; * AI assistance
	      "ai-setup.el"

	      ;; * Math
	      ;; "math-setup.el"

	      ;; * Documents
	      ;; "pdf-setup.el"

	      ;; * Encryption / Decryption
	      ;; "crypto-setup.el"

	      ;; * Diffs
	      "diff-setup.el"

	      ;; * Version control
	      "magit-setup.el"

	      ;; * Snippets
	      ;; "snippets-setup.el"

	      ;; * Vertico
	      "vertico-setup.el"

	      ;; * Consult
	      "consult-setup.el"

	      "mode-line-setup.el"

	      ;; * Activities
	      "activities-setup.el"))

;; M-x customize
(setq custom-file (locate-user-emacs-file "custom-vars.el"))
(load custom-file 'noerror 'nomessage)
(put 'narrow-to-region 'disabled nil)
