;;; init-programming.el --- general programming settings

(global-set-key (kbd "C-c M") 'comment-region)
(global-set-key [f7] 'compile)

(setq gdb-many-windows t)
(which-function-mode t)

(require 'gtags)
(require 'xcscope)

(defun programming-cleanup-buffer ()
  (interactive)
  (untabify (point-min) (point-max))
  (indent-region (point-min) (point-max))
  (delete-trailing-whitespace))

(when (> emacs-major-version 23)
  (add-hook 'prog-mode-hook 'idle-highlight-mode))

(require 'thrift-mode)
(require 'protobuf-mode)

(provide 'init-programming)
