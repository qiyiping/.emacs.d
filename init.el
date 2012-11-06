;; load path
(add-to-list 'load-path "~/.emacs.d/")
(add-to-list 'load-path "~/.emacs.d/vendor/")

;; package settings
(require 'init-package)
(require 'init-ui)
(require 'init-misc)
(require 'init-auto-complete)
(require 'init-yasnippet)
(require 'init-ibuffer)
(require 'init-shell)
(require 'init-ido)
(require 'init-isearch)
(require 'init-general-editing)
(require 'init-markdown)
