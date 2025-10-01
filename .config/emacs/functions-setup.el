;;;  -*- lexical-binding: t; -*-
;;; functions-setup.el -- Custom function definitions
;;;

(defun consult-recent-file-other-window ()
  "Find recent file using `completing-read'."
  (interactive)
  (find-file-other-window
   (consult--read
    (or
     (mapcar #'consult--fast-abbreviate-file-name (bound-and-true-p recentf-list))
     (user-error "No recent files, `recentf-mode' is %s"
                 (if recentf-mode "enabled" "disabled")))
    :prompt "Find recent file: "
    :sort nil
    :require-match t
    :category 'file
    :state (consult--file-preview)
    :history 'file-name-history)))

(defun goto-line-num-at-point-in-recent-file ()
  "Modified version of `consult-recent-file' that jumps to line
number of `number-at-point' upon file selection"
  (interactive)
  (let ((line-num (number-at-point)))
    (if line-num
	(progn
	  (find-file
	   (consult--read
	    (or
	     (mapcar #'consult--fast-abbreviate-file-name (bound-and-true-p recentf-list))
	     (user-error "No recent files, `recentf-mode' is %s"
			 (if recentf-mode "enabled" "disabled")))
	    :prompt (format "Goto line %d in recent file: " line-num)
	    :sort nil
	    :require-match t
	    :category 'file
	    :state (consult--file-preview)
	    :history 'file-name-history))
	  (goto-line line-num))
      (message "No number-at-point found"))))
