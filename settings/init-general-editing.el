;;; init-general-editing.el --- general editing settings

(global-font-lock-mode t)

;; (require 'autopair)
;; (setq autopair-autowrap t)
;; (autopair-global-mode t)

(electric-pair-mode t)

(show-paren-mode t)
(setq show-paren-style 'parenthesis)

(setq query-replace-highlight t)

;; setup keybind for `set-mark-command' in windows
(when (eq system-type 'windows-nt)
  (global-unset-key (kbd "C-SPC"))
  (global-set-key (kbd "M-SPC") 'set-mark-command))

;; Uniquify buffer name display
(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)

(transient-mark-mode t)

;; auto fill
(add-hook 'text-mode-hook 'turn-on-auto-fill)
(set-fill-column 80)

;; flyspell
(ispell-change-dictionary "american" t)

(defvar writing-mode-hooks '(text-mode-hook
                             org-mode-hook))

(when (or (eq system-type 'darwin)
	  (eq system-type 'gnu/linux)
	  (eq system-type 'cygwin))
  (dolist (mode-hook writing-mode-hooks)
    (add-hook mode-hook '(lambda () (flyspell-mode +1)))))

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

;; very large file
(require 'vlf-setup)

;; undo tree
;; C-x u -> `undo-tree-visualize'
(require 'undo-tree)
(global-undo-tree-mode)

;; Revert buffer w/o confirm
(defun revert-buffer-no-confirm ()
  "Revert buffer without confirmation."
  (interactive)
  (revert-buffer t t))
(global-set-key [f5] 'revert-buffer-no-confirm)

;; windmove
;; alternative package `windmove':
(windmove-default-keybindings 'meta)
(setq windmove-wrap-around t)
(require 'switch-window)
(global-set-key (kbd "C-x o") 'switch-window)

;; ace jump mode
(autoload
  'ace-jump-mode
  "ace-jump-mode"
  "Emacs quick move minor mode"
  t)
(setq ace-pinyin-use-avy nil)
(ace-pinyin-global-mode 1)
(define-key global-map (kbd "C-:") 'ace-jump-char-mode)
(define-key global-map (kbd "C-c :") 'ace-jump-mode)

;; swiper
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)
(global-set-key (kbd "C-c o") 'swiper)

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

(global-set-key (kbd "C-c w") 'copy-symbol-at-point)
(global-set-key (kbd "C-c K") 'copy-line)
(global-set-key (kbd "C-c k") (lambda ()
                                (interactive)
                                (kill-whole-line)))
(global-set-key (kbd "C-c j") (lambda ()
                                (interactive)
                                (join-line -1)))

(defun rotate-windows ()
  "Rotate windows"
  (interactive)
  (cond ((not (> (count-windows) 1))
         (message "You can't rotate a single window!"))
        (t
         (setq i 1)
         (setq n (count-windows))
         (while (< i n)
           (let* ((w1 (elt (window-list) i))
                  (w2 (elt (window-list) (+ (% i n) 1)))

                  (b1 (window-buffer w1))
                  (b2 (window-buffer w2))

                  (s1 (window-start w1))
                  (s2 (window-start w2)))
             (set-window-buffer w1  b2)
             (set-window-buffer w2 b1)
             (set-window-start w1 s2)
             (set-window-start w2 s1)
             (setq i (1+ i)))))))

(global-set-key (kbd "M-R") 'rotate-windows)

(provide 'init-general-editing)
