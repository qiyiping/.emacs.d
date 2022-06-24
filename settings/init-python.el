;;; init-python.el --- python settings

;; Jedi.el
;; http://tkf.github.io/emacs-jedi/latest/
;; requirement
;; python package: jedi, epc, virtualenv
;; (add-hook 'python-mode-hook 'jedi:setup)
;; (setq jedi:complete-on-dot t)

;; ;; anaconda-mode
;; (add-hook 'python-mode-hook 'anaconda-mode)
;; (add-hook 'python-mode-hook 'anaconda-eldoc-mode)
;; (eval-after-load "company"
;;   '(add-to-list 'company-backends '(company-anaconda :with company-capf)))

;; language server
(add-hook 'python-mode-hook 'eglot-ensure)

;; virtualenvwrapper
(setq venv-location "~/.virtualenvs/")

;; `auto-mode-alist' for python
(add-to-list 'auto-mode-alist '("SConstruct\\'" . python-mode))
(add-to-list 'auto-mode-alist '("YBUILD\\'" . python-mode))

(setq python-shell-interpreter "ipython"
      python-shell-interpreter-args "--simple-prompt -i")

;; ein
(require 'ein)
(setq ein:completion-backend 'ein:use-company-backend)

(add-hook 'inferior-python-mode-hook '(lambda ()
                                        (local-set-key (kbd "C-l") 'shell-clear)))
(setq ein:jupyter-default-server-command "jupyter")

(provide 'init-python)
