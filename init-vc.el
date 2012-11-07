;;; init-vc.el --- version control tools settings

(require 'magit)
(global-set-key (kbd "C-c s") 'magit-status)
;; (require 'psvn)

(provide 'init-vc)
