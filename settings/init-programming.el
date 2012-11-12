;;; init-programming.el --- general programming settings

(global-set-key (kbd "C-c M") 'comment-region)
(global-set-key [f7] 'compile)

(setq gdb-many-windows t)
(which-function-mode t)

;; (setq gtags-suggested-key-mapping t)
(require 'gtags)
(require 'xcscope)

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
  (setq show-trailing-whitespace t )
  (idle-highlight-mode t))

(if (> emacs-major-version 23)
    (add-hook 'prog-mode-hook 'programming-common-settings)
  (dolist (mode-hook programming-mode-hooks)
    (add-hook mode-hook 'programming-common-settings)))

(setq-default imenu-auto-rescan t)
(global-set-key (kbd "C-x C-i") 'imenu)

(require 'thrift-mode)
(require 'protobuf-mode)

(provide 'init-programming)