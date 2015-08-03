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
(require 'init-xml)
(require 'init-web)
(require 'init-scala)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("2e5705ad7ee6cfd6ab5ce81e711c526ac22abed90b852ffaf0b316aa7864b11f" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
