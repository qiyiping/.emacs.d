;;; init-package.el --- set up the package manager

;; (add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
;; (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)

(setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
                         ("org"   . "http://elpa.emacs-china.org/org/")
                         ("melpa" . "http://elpa.emacs-china.org/melpa/")))

(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

;; (package-install-selected-packages)

(provide 'init-package)
