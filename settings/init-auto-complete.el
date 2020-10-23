;; init-auto-complete.el --- auto-complete settings

(defun my-company-mode-setup ()
  (setq company-idle-delay 0.5)
  (setq company-show-numbers t)
  (setq company-tooltip-limit 10)
  (setq company-minimum-prefix-length 2)
  (setq company-tooltip-align-annotations t)
  (setq company-tooltip-flip-when-above t)
  (global-company-mode 1)
  ;; (company-quickhelp-mode)
  ;; (setq company-quickhelp-delay 1.0)
  )

(add-hook 'after-init-hook 'my-company-mode-setup)

;; ;; how to enable ac in major-mode?
;; ;; add major-mode to `ac-modes'
;; ;; setup `ac-source' for the major-mode

;; (require 'auto-complete-config)
;; (ac-config-default)

;; (require 'auto-complete-c-headers)

;; (defun my-ac-cc-mode-setup ()
;;   (add-to-list 'ac-sources 'ac-source-c-headers)
;;   (add-to-list 'ac-sources 'ac-source-yasnippet))

;; (add-hook 'c-mode-common-hook 'my-ac-cc-mode-setup)

(provide 'init-auto-complete)
