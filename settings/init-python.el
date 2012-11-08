;;; init-python.el --- python settings

;; ;; Use python.el from http://github.com/fgallina/python.el
;; ;; Use the master branch in emacs24 and the emacs23 branch in emacs23
;; (require 'python)

(add-to-list 'auto-mode-alist '("SConstruct\\'" . python-mode))
(add-to-list 'auto-mode-alist '("YBUILD\\'" . python-mode))

(provide 'init-python)
