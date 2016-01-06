(require 'auto-complete-config)
(ac-config-default)

(require 'auto-complete-c-headers)

(defun my-ac-cc-mode-setup ()
  (add-to-list 'ac-sources 'ac-source-c-headers)
  (add-to-list 'ac-sources 'ac-source-yasnippet))

(add-hook 'c-mode-common-hook 'my-ac-cc-mode-setup)

(defun my-ac-latex-mode-setup ()
  (add-to-list 'ac-sources 'ac-source-math-unicode)
  (add-to-list 'ac-sources 'ac-source-math-latex)
  (add-to-list 'ac-sources 'ac-source-latex-commands))

(add-hook 'LaTeX-mode-hook 'my-ac-latex-mode-setup)

(defun my-ac-org-mode-setup ()
  (add-to-list 'ac-sources 'ac-source-math-unicode))

(add-hook 'org-mode-hook 'my-ac-org-mode-setup)

(provide 'init-auto-complete)
