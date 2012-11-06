;;; init-general-editing.el --- general editing settings

(global-font-lock-mode t)

(require 'autopair)
(setq autopair-autowrap t)
(autopair-global-mode t)

(show-paren-mode t)
(setq show-paren-style 'parenthesis)

(setq query-replace-highlight t)

;; Uniquify buffer name display
(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)

(transient-mark-mode t)

(setq-default  ediff-split-window-function 'split-window-horizontally
	       ediff-window-setup-function 'ediff-setup-windows-plain)

(setq backup-by-copying t)
(setq backup-directory-alist '((".*" . "~/.emacs.d/backup/")))

(setq bookmark-default-file "~/.emacs.d/.bookmarks.el")

(setq-default indent-tabs-mode nil
	      show-trailing-whitespace t )

(provide 'init-general-editing)
