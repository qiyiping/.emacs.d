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
                    "/usr/X11/bin"))
  (setenv "LC_CTYPE" "UTF-8"))

(when (eq system-type 'windows-nt)
  (add-to-list 'exec-path "c:/Program Files (x86)/Git/bin/")
  (add-to-list 'exec-path "c:/Program Files (x86)/global/bin/"))

(provide 'init-exec-path)
