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
                          helm
                          helm-projectile
                          helm-bibtex
                          nyan-mode
                          auctex
                          ace-jump-mode
                          ace-pinyin
                          autopair
                          paredit
                          smex
                          htmlize
                          ido-ubiquitous
                          magit
                          idle-highlight-mode
                          markdown-mode
                          dired+
                          undo-tree
                          beacon
                          rainbow-delimiters
                          slime
                          swiper
                          powerline
                          vlf
                          cal-china-x
                          xcscope
                          exec-path-from-shell
                          multi-term
                          csharp-mode
                          auto-complete-c-headers
                          scala-mode2
                          sbt-mode
                          dirtree
                          web-mode
                          color-theme-solarized
                          org
                          ;; python related mode
                          jedi
                          ein
                          ;; anaconda-mode
                          virtualenvwrapper
                          zenburn-theme
                          ggtags
                          dictionary
                          switch-window
                          lua-mode)
  "A list of packages ensured to be installed at launch.")

(dolist (p my-package-list)
  (when (not (package-installed-p p))
    (package-install p)))

(provide 'init-package)
