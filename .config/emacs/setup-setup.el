;;;  -*- lexical-binding: t; -*-
;;; setup-setup.el -- Configurations to enable or simplify later configuration
;;;

;; Platform:
(defmacro when-mac (then)
  `(when (eq system-type 'darwin)
     ,then))

(defmacro when-linux (then)
  `(when (eq system-type 'gnu/linux)
     ,then))

;; Macros:

(defmacro => (&rest body)
  "Turn BODY into a lambda function."
  `(lambda ()
     ,@body))

(defmacro ==> (&rest body)
  "Turn BODY into an interactively-callable lambda function."
  `(lambda ()
     (interactive)
     ,@body))

(defmacro keybind--keybind (bind-func key func)
  "Helper macro used internally by `keybind' and `keybind-local'."
  (if (listp func)
      `(,bind-func (kbd ,key) ,func)
    `(,bind-func (kbd ,key) (quote ,func))))

(defmacro keybind (key func)
  "Bind KEY, given as a string (e.g. \"C-x s\") to the function
FUNC (given as an unquoted symbol, or as a raw definition)."
  `(keybind--keybind
    global-set-key ,key ,func))

(defmacro keybind-local (key func)
  "Bind KEY locally, given as a string (e.g. \"C-x s\") to the
function FUNC (given as an unquoted symbol, or as a raw definition)."
  `(keybind--keybind
    local-set-key ,key ,func))

(defmacro keybinds--keybinds (kb kbs &rest keys-functions)
  "Helper macro used internally by `keybinds' and `keybinds-local'."
    (let ((key (car keys-functions))
	(func (cadr keys-functions))
	(rest (cddr keys-functions)))
    (when func
	`(progn
	   (,kb ,key ,func)
	   (,kbs ,@rest)))))

(defmacro keybinds (&rest keys-functions)
  "Apply the `keybind' macro pairwise through the argument list."
  `(keybinds--keybinds
    keybind keybinds ,@keys-functions))

(defmacro keybinds-local (&rest keys-functions)
  "Apply the `keybind-local' macro pairwise through the argument list."
  `(keybinds--keybinds
    keybind-local keybinds-local ,@keys-functions))

;; Leader key:

(global-unset-key (kbd "C-z"))
