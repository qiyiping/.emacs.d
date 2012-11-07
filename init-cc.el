;;; init-cc.el --- c/c++ settings

(require 'cc-mode)
(require 'google-c-style)

(defun my-c-mode-common-settings ()
  (c-toggle-auto-hungry-state t)
  (c-toggle-hungry-state t)
  (c-toggle-auto-newline -1)
  (setq indent-tabs-mode nil)
  (google-set-c-style)
  ;; (c-set-style "stroustrup")
  ;; (setq c-basic-offset 4)
  ;; (setq tab-width 4))
  )

(add-hook 'c-mode-common-hook 'my-c-mode-common-settings)

(defun my-c-mode-hs-settings ()
  (hs-minor-mode t)
  (local-set-key (kbd "C-c TAB") 'hs-toggle-hiding)
  (local-set-key (kbd "C-c S") 'hs-show-all)
  (local-set-key (kbd "C-c H") 'hs-hide-all)
  (setq hs-hide-comments nil)
  (setq hs-isearch-open t))

(add-hook 'c-mode-common-hook 'my-c-mode-hs-settings)

(add-hook 'c-mode-common-hook '(lambda ()
                                 (gtags-mode t)))

;; some useful keybindings in cc-mode:
;; C-M-h (c-mark-function)
;; C-c C-c (comment-region)
;; C-M-a (c-beginning-of-defun)
;; C-M-e (c-end-of-defun)

(provide 'init-cc)
