;;; init-exec-path.el --- execution path settings

(when (or (eq system-type 'darwin)
	  (eq system-type 'gnu/linux)
	  (eq system-type 'cygwin))
  (exec-path-from-shell-initialize)
  (setenv "LC_CTYPE" "UTF-8"))

(provide 'init-exec-path)
