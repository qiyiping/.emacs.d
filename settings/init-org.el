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

(defun my-org-mode-hook ()
  ;; LaTeX
  (setq org-latex-pdf-process
        '("xelatex -interaction nonstopmode %f" "xelatex -interaction nonstopmode %f"))
  (add-to-list 'org-latex-packages-alist
               '("" "xeCJK" t))
  (add-to-list 'org-latex-packages-alist
               '("" "amsmath, amssymb, amsthm" t)))

(add-hook 'org-mode-hook 'my-org-mode-hook)


;; http://orgmode.org/manual/Easy-Templates.html
;; To insert a structural element, type a ‘<’, followed by a template
;; selector and <TAB>. Completion takes effect only when the above
;; keystrokes are typed on a line by itself.
;; The following template selectors are currently supported.
;; s    #+BEGIN_SRC ... #+END_SRC
;; e    #+BEGIN_EXAMPLE ... #+END_EXAMPLE
;; q    #+BEGIN_QUOTE ... #+END_QUOTE
;; v    #+BEGIN_VERSE ... #+END_VERSE
;; c    #+BEGIN_CENTER ... #+END_CENTER
;; l    #+BEGIN_LaTeX ... #+END_LaTeX
;; L    #+LaTeX:
;; h    #+BEGIN_HTML ... #+END_HTML
;; H    #+HTML:
;; a    #+BEGIN_ASCII ... #+END_ASCII
;; A    #+ASCII:
;; i    #+INDEX: line
;; I    #+INCLUDE: line

;; http://orgmode.org/orgcard.txt

(provide 'init-org)
