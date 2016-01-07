;; init-auto-complete.el --- auto-complete settings

;; how to enable ac in major-mode?
;; add major-mode to `ac-modes'
;; setup `ac-source' for the major-mode

(require 'auto-complete-config)
(ac-config-default)

(require 'auto-complete-c-headers)

(defun my-ac-cc-mode-setup ()
  (add-to-list 'ac-sources 'ac-source-c-headers)
  (add-to-list 'ac-sources 'ac-source-yasnippet))

(add-hook 'c-mode-common-hook 'my-ac-cc-mode-setup)

(provide 'init-auto-complete)
