;;; init-programming.el --- general programming settings

;; (global-set-key (kbd "C-c M") 'comment-region)
(global-set-key [f7] 'compile)

;; smart-compile+ package
;; smart-compile & smart-run
(require 'smart-compile+)

(setq gdb-many-windows t)
(which-function-mode t)

(require 'xcscope)
(cscope-setup)

(defun programming-cleanup-buffer ()
  (interactive)
  (untabify (point-min) (point-max))
  (indent-region (point-min) (point-max))
  (delete-trailing-whitespace))

(global-set-key (kbd "C-c C") 'programming-cleanup-buffer)

(defvar programming-mode-hooks '(c-mode-common-hook
                                 python-mode-hook
                                 perl-mode-hook
                                 emacs-lisp-mode-hook
                                 scheme-mode-hook
                                 sh-mode-hook)
  "Programming mode hook")

(defun programming-common-settings ()
  (setq indent-tabs-mode nil)
  (setq show-trailing-whitespace t)
  (rainbow-delimiters-mode t)
  (idle-highlight-mode t))

(if (> emacs-major-version 23)
    (add-hook 'prog-mode-hook 'programming-common-settings)
  (dolist (mode-hook programming-mode-hooks)
    (add-hook mode-hook 'programming-common-settings)))

;; imenu settings
(setq-default imenu-auto-rescan t)
;; (defvar programming-imenu-positions
;;   '()
;;   "imenu jump stack")

;; (defun programming-imenu-jump ()
;;   (interactive)
;;   (let ((pos (point)))
;;     (unless (eq (car programming-imenu-positions) pos)
;;       (push pos programming-imenu-positions)))
;;   (call-interactively 'imenu))

;; (defun programming-imenu-jump-back ()
;;   (interactive)
;;   (let ((pos (pop programming-imenu-positions)))
;;     (if pos
;;         (goto-char pos)
;;       (message "imenu jump stack is empty"))))

;; (global-set-key (kbd "C-x i") 'programming-imenu-jump)
;; (global-set-key (kbd "C-x p") 'programming-imenu-jump-back)

;; other useful programming modes
(require 'thrift-mode)
(require 'protobuf-mode)
(add-to-list 'auto-mode-alist '("\\.proto\\'" . protobuf-mode))

(provide 'init-programming)
