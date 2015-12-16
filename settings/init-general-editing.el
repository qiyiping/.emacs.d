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
(set-fill-column 80)

(setq-default indent-tabs-mode nil)

;; Backup file by copying to specified place
(setq backup-by-copying t)
(setq backup-directory-alist '((".*" . "~/.emacs.d/backup/")))

;; Bookmark keybindings
;; ctrl-x-r-m -> bookmark-set
;; ctrl-x-r-b -> bookmark-jump
;; ctrl-x-r-l -> bookmark-list
(setq bookmark-default-file "~/.emacs.d/.bookmarks.el")

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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Some handy edit toolkit
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun delete-all-blank-lines ()
  "Delete all blank line by calling `delete-matching-lines'"
  (interactive)
  (delete-matching-lines "^[ \t]*$"))

(defun copy-symbol-at-point ()
  (interactive)
  (let ((symbol (symbol-at-point)))
    (if symbol (kill-new (symbol-name symbol)))))

(defun current-regexp-at-point(regexp)
  (save-excursion
    (if (looking-at regexp)
        (progn
          (while (looking-at regexp)
            (backward-char 1))
          (forward-char 1)
          (looking-at regexp)
          (match-string 0)))))

(defun my-ansi-color-apply-buffer(buffer)
  "Apply ansi color on buffer. `buffer' should be *read-only*"
  (with-current-buffer buffer
    (if buffer-read-only
        (progn
          (toggle-read-only)
          (ansi-color-apply-on-region (point-min) (point-max))
          (toggle-read-only)))))

(defun copy-line ()
  (interactive)
  (kill-ring-save (line-beginning-position) (line-end-position)))

(global-set-key (kbd "C-c W") 'copy-symbol-at-point)
(global-set-key (kbd "C-c K") 'copy-line)
(global-set-key (kbd "C-c J") (lambda ()
                                (interactive)
                                (join-line -1)))

(defun my-insert-file-path ()
  (interactive)
  (insert (read-file-name "File: ")))

(provide 'init-general-editing)
