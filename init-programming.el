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

(defvar programming-mode-hooks '(c-mode-common-hook
                                 python-mode-hook
                                 perl-mode-hook
                                 emacs-lisp-mode-hook
                                 scheme-mode-hook
                                 sh-mode-hook)
  "Programming mode hook")

;; Specify ff search directories
(setq-default ff-search-directories
              '("."
                "/usr/local/include/"
                "/usr/include/c++/4.4/"
                "/usr/include/sys/"
                "/usr/include/"
                "~/Projects/jike/coding/"
                "~/Projects/jike/coding/.ymake-out/opt/thrift-out/"
                "~/Projects/jike/coding/.ymake-out/dbg/thrift-out/"))

(if (> emacs-major-version 23)
    (progn
      (add-hook 'prog-mode-hook 'idle-highlight-mode)
      (add-hook 'prog-mode-hook '(lambda ()
                                   (local-set-key (kbd "C-x C-o") 'ff-find-other-file))))
  (dolist (mode-hook programming-mode-hooks)
    (add-hook mode-hook 'idle-highlight-mode)
    (add-hook mode-hook '(lambda ()
                           (local-set-key (kbd "C-x C-o") 'ff-find-other-file)))))

(require 'thrift-mode)
(require 'protobuf-mode)

(provide 'init-programming)