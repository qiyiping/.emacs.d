;;; init-cc.el --- c/c++ settings

(require 'cc-mode)
(require 'google-c-style)

(defun my-c-mode-hs-settings ()
  (hs-minor-mode t)
  (local-set-key (kbd "C-c TAB") 'hs-toggle-hiding)
  (local-set-key (kbd "C-c S") 'hs-show-all)
  (local-set-key (kbd "C-c H") 'hs-hide-all)
  (setq hs-hide-comments nil)
  (setq hs-isearch-open t))

(defun my-c-mode-common-settings ()
  (c-toggle-auto-hungry-state t)
  (c-toggle-hungry-state t)
  (c-toggle-auto-newline -1)
  (setq indent-tabs-mode nil)
  (my-c-mode-hs-settings)
  ;; (ggtags-mode 1)
  ;; (define-key ggtags-mode-map (kbd "M-*") 'pop-tag-mark)
  (google-set-c-style))

(add-hook 'c-mode-common-hook 'my-c-mode-common-settings)

;; language servers
;; (add-hook 'c-mode-common-hook #'lsp)
;; (add-to-list 'eglot-server-programs '((c++-mode c-mode) "clangd"))
;; (add-hook 'c-mode-hook 'eglot-ensure)
;; (add-hook 'c++-mode-hook 'eglot-ensure)

;; some useful keybindings in cc-mode:
;; C-M-h (c-mark-function)
;; C-c C-c (comment-region)
;; C-M-a (c-beginning-of-defun)
;; C-M-e (c-end-of-defun)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; cc search directory
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defvar search-directories-file
  "~/.emacs.d/search-directories.el")

(defun save-search-directories ()
  "Save `cc-search-directories' in `search-directories-file'"
  (let ((coding-system-for-write 'utf-8))
    (write-region
     (concat ";; Set `cc-search-directories' which will be used by `ff-search-directories'\n"
             "(setq cc-search-directories '"
             (prin1-to-string cc-search-directories)
             ")\n")
     nil
     search-directories-file
     nil
     'silent)))

(defun add-search-directories (search-dir)
  (interactive "DSearch Directory: ")
  (add-to-list 'cc-search-directories search-dir)
  (save-search-directories))

(add-hook 'after-init-hook (lambda () (load search-directories-file t)))

(add-hook 'c-mode-common-hook '(lambda ()
                                 (local-set-key (kbd "C-x C-o") 'ff-find-other-file)))


;; bazel mode
(add-to-list 'auto-mode-alist '("/BUILD\\(\\..*\\)?\\'" . bazel-mode))
(add-to-list 'auto-mode-alist '("/WORKSPACE\\'" . bazel-mode))
(add-to-list 'auto-mode-alist '("\\.\\(BUILD\\|WORKSPACE\\|bzl\\)\\'" . bazel-mode))

;; cmake mode
(add-to-list 'auto-mode-alist '("CMakeLists\\.txt\\'" . cmake-mode))
(add-to-list 'auto-mode-alist '("\\.cmake\\'" . cmake-mode))
(add-hook 'cmake-mode 'eglot-ensure)

(provide 'init-cc)
