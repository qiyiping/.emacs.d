;; load path
;; (add-to-list 'load-path "~/.emacs.d/")

;; (package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(ace-pinyin ag aider auctex autopair bazel-mode beacon cal-china-x
                cargo cheat-sh claude-code-ide cmake-mode
                color-theme-solarized company-anaconda
                company-quickhelp csharp-mode csv-mode dash-at-point
                dash-functional dictionary dirtree eglot ein ess
                exec-path-from-shell ggtags ghub go-autocomplete
                go-eldoc google-c-style google-this gptel-fn-complete
                graphql gscholar-bibtex hackernews helm-ag helm-bibtex
                helm-dash helm-dictionary helm-projectile htmlize
                idle-highlight-mode jedi js-comint js2-refactor
                jupyter key-chord leetcode lua-mode magit-popup
                markdown-toc math-symbol-lists multi-term nyan-mode
                osx-dictionary paredit pkg-info project-explorer
                rainbow-delimiters sbt-mode selectric-mode skewer-mode
                slime smex spaceline spacemacs-theme spinner
                sr-speedbar swiper switch-window tern-auto-complete
                tldr track-changes treemacs undo-tree use-package
                virtualenvwrapper vlf web-beautify web-mode which-key
                xcscope xkcd yaml-mode yasnippet-snippets
                youdao-dictionary zenburn-theme))
 '(package-vc-selected-packages
   '((claude-code-ide :url
                      "https://github.com/manzaltu/claude-code-ide.el"))))
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
(require 'init-julia)
(require 'init-lisp)
(require 'init-lua)
(require 'init-go)
(require 'init-rust)
(require 'init-auctex)
(require 'init-org)
(require 'init-markdown)
(require 'init-eim)
(require 'init-web)
(require 'init-scala)
(require 'init-bibtex)
(require 'init-mail)
