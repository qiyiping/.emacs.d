;;; init-python.el --- python settings

;; Jedi.el
;; http://tkf.github.io/emacs-jedi/latest/
;; requirement
;; python package: jedi, epc, virtualenv
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)

;; anaconda-mode
;; (add-hook 'python-mode-hook 'anaconda-mode)
;; (add-hook 'python-mode-hook 'anaconda-eldoc-mode)

;; virtualenvwrapper
(setq venv-location "~/.virtualenv/")

;; `auto-mode-alist' for python
(add-to-list 'auto-mode-alist '("SConstruct\\'" . python-mode))
(add-to-list 'auto-mode-alist '("YBUILD\\'" . python-mode))

(setq python-shell-interpreter "ipython"
      python-shell-interpreter-args "-i")

(setq python-eldoc-setup-code
  "def __PYDOC_get_help(obj):
    try:
        doc = help(obj)
    except:
        doc = ''
    try:
        exec('print doc')
    except SyntaxError:
        print(doc)"
  )

;; ein
(setq ein:use-auto-complete t)
(add-hook 'ein:connect-mode-hook 'ein:jedi-setup)



(provide 'init-python)
