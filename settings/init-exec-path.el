;;; init-exec-path.el --- execution path settings

(exec-path-from-shell-initialize)
(when (eq system-type 'darwin)
  (setenv "LC_CTYPE" "UTF-8"))

(provide 'init-exec-path)
