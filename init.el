;; load path
;; (add-to-list 'load-path "~/.emacs.d/")
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
(require 'init-auctex)
(require 'init-org)
(require 'init-markdown)
(require 'init-eim)
(require 'init-web)
(require 'init-scala)
(require 'init-bibtex)
(require 'init-mail)
