;;; set up the package manager

(require 'package)

(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))

(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents))

(defvar my-package-list '(auto-complete
			  yasnippet
			  google-c-style
			  quack
			  gtags
			  paredit
			  smex
			  ido-ubiquitous
			  magit
			  idle-highlight-mode)
  "A list of packages ensured to be installed at launch.")

(dolist (p my-package-list)
  (when (not (package-installed-p p))
    (package-install p)))

(provide 'package-settings)
