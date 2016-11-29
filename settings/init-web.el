;;; init-web.el

;; requirement
;; `npm install -g eslint babel-eslint eslint-plugin-react tern js-beautify'

;; web mode

(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))

(with-eval-after-load 'web-mode
  (add-to-list 'web-mode-indentation-params '("lineup-args" . nil))
  (add-to-list 'web-mode-indentation-params '("lineup-concats" . nil))
  (add-to-list 'web-mode-indentation-params '("lineup-calls" . nil)))

(defun my-web-mode-settings ()
  (setq-default  web-mode-markup-indent-offset 2
                 web-mode-css-indent-offset 2
                 web-mode-code-indent-offset 2
                 web-mode-attr-indent-offset 2))

(add-hook 'web-mode-hook 'my-web-mode-settings)

;; js2 mode
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.jsx?\\'" . js2-jsx-mode))
(add-to-list 'interpreter-mode-alist '("node" . js2-mode))

(defun my-js-mode-settings ()
  (tern-mode t)
  (tern-ac-setup)
  (js2-refactor-mode)
  (setq-default js2-basic-offset 2))

(add-hook 'js2-mode-hook 'my-js-mode-settings)

;; css mode
(defun my-css-mode-settings ()
  (set-default css-indent-offset 2))

(add-hook 'css-mode-hook 'my-css-mode-settings)

;; skewer mode
;; M-x `run-skewer' to attach a browser to Emacs
(skewer-setup)

;; json mode
(require 'json)

(provide 'init-web)
