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

(add-hook 'text-mode-hook 'turn-on-auto-fill)
(setq fill-column 80)

;; Backup file by copying to specified place
(setq backup-by-copying t)
(setq backup-directory-alist '((".*" . "~/.emacs.d/backup/")))

(setq bookmark-default-file "~/.emacs.d/.bookmarks.el")

(setq-default indent-tabs-mode nil
	      show-trailing-whitespace t )

(setq-default  ediff-split-window-function 'split-window-horizontally
	       ediff-window-setup-function 'ediff-setup-windows-plain)

(eval-after-load 'grep
  '(when (boundp 'grep-find-ignored-files)
     (add-to-list 'grep-find-ignored-files "*.svn-base")))

;; hippie expand
(global-set-key (kbd "M-/") 'hippie-expand)
(setq hippie-expand-try-functions-list
      '(try-complete-file-name-partially
        try-complete-file-name
        try-expand-dabbrev
        try-expand-dabbrev-all-buffers
        try-expand-dabbrev-from-kill))

;; Save visit place of previously visited files
(require 'saveplace)
(setq-default save-place t)
(setq save-place-file "~/.emacs.d/saved-places")

(provide 'init-general-editing)
