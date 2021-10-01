;;; init-package.el --- set up the package manager

;; (setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
;;                          ("melpa" . "https://melpa.org/packages/")
;;                          ("melpa-stable" . "https://stable.melpa.org/packages/")))

(setq package-archives '(("gnu" . "http://elpa.emacs-china.org/gnu/")
                         ("org" . "http://elpa.emacs-china.org/org/")
                         ("melpa-stable" . "http://elpa.emacs-china.org/stable-melpa/")
			 ("melpa" . "http://elpa.emacs-china.org/melpa/")))

(setq package-archive-priorities '(("gnu" . 10)
				   ("melpa-stable" . 7)
				   ("org" . 5)
				   ("melpa" . 1)))

(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

;; (package-install-selected-packages)

(provide 'init-package)
