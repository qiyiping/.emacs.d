;;; init-exec-path.el --- execution path settings
(when (eq system-type 'darwin)
  (setq exec-path '("/opt/local/bin"
                    "/opt/local/sbin"
                    "/usr/bin"
                    "/bin"
                    "/usr/sbin"
                    "/sbin"
                    "/usr/local/bin"
                    "/usr/texbin"
                    "/usr/X11/bin")))

(provide 'init-exec-path)