;;; init-org.el --- org mode settings

(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(define-key global-map "\C-cb" 'org-iswitchb)
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))

(setq org-log-done 'time
      org-completion-use-ido t
      org-edit-timestamp-down-means-later t
      org-agenda-start-on-weekday nil
      org-agenda-span 14
      org-agenda-window-setup 'current-window
      org-export-kill-product-buffer-when-displayed t
      org-startup-indented t)

(setq org-agenda-files (list "~/Documents/org/Plan.org"))

;; LaTeX
(setq org-latex-pdf-process
      '("xelatex -interaction nonstopmode %f" "xelatex -interaction nonstopmode %f"))
(add-to-list 'org-latex-packages-alist
             '("" "xeCJK" t))

(provide 'init-org)
