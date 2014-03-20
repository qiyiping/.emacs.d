;;; init-package.el --- set up the package manager

(require 'package)

(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)

(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents))

(defvar my-package-list '(auto-complete
			  yasnippet
			  google-c-style
			  ;; quack
			  ;; gtags
			  auctex
			  autopair
			  paredit
			  smex
			  htmlize
			  ido-ubiquitous
			  magit
			  idle-highlight-mode
                          markdown-mode
                          zencoding-mode
                          csharp-mode
                          jedi
                          lua-mode)
  "A list of packages ensured to be installed at launch.")

(dolist (p my-package-list)
  (when (not (package-installed-p p))
    (package-install p)))

(provide 'init-package)
