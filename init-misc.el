;;; init-misc.el --- goodies

;; Revert buffer w/o confirm
(defun revert-buffer-no-confirm ()
  "Revert buffer without confirmation."
  (interactive)
  (revert-buffer t t))
(global-set-key [f5] 'revert-buffer-no-confirm)

(provide 'init-misc)
