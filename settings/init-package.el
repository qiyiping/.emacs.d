;;; init-package.el --- set up the package manager

(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)

(package-initialize)

;; (package-install-selected-packages)

(provide 'init-package)
