;; load path
;; (add-to-list 'load-path "~/.emacs.d/")

;; (package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (sr-speedbar markdown-toc yaml-mode helm-dash dash-at-point xkcd selectric-mode skewer-mode js2-refactor web-beautify tern-auto-complete tern js-comint js2-mode project-explorer gscholar-bibtex spaceline spacemacs-theme tldr zenburn-theme yasnippet xcscope web-mode vlf virtualenvwrapper undo-tree switch-window swiper smex slime sbt-mode rainbow-delimiters python powerline paredit org nyan-mode multi-term math-symbol-lists markdown-mode magit lua-mode key-chord jedi ido-ubiquitous idle-highlight-mode hydra htmlize helm-projectile helm-dictionary helm-bibtex google-c-style go-eldoc go-autocomplete ggtags exec-path-from-shell ein dirtree dired+ dictionary csharp-mode color-theme-solarized cal-china-x beacon autopair auto-complete-c-headers auctex anaconda-mode ace-pinyin))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(add-to-list 'load-path "~/.emacs.d/vendor/")
(add-to-list 'load-path "~/.emacs.d/settings/")

;; package settings
(require 'init-package)
(require 'init-ui)
(require 'init-misc)
(require 'init-exec-path)
(require 'init-auto-complete)
(require 'init-yasnippet)
(require 'init-ibuffer)
(require 'init-shell)
(require 'init-dired)
;; (require 'init-ido)
(require 'init-helm)
(require 'init-isearch)
(require 'init-general-editing)
(require 'init-programming)
(require 'init-vc)
(require 'init-cc)
(require 'init-csharp)
(require 'init-python)
(require 'init-lisp)
(require 'init-lua)
(require 'init-go)
(require 'init-auctex)
(require 'init-org)
(require 'init-markdown)
(require 'init-eim)
(require 'init-web)
(require 'init-scala)
(require 'init-bibtex)
(require 'init-mail)
