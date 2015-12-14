;;; init-helm.el --- helm settings

;; http://tuhdo.github.io/helm-intro.html

(require 'helm)
(require 'helm-config)

;; The default "C-x c" is quite close to "C-x C-c", which quits Emacs.
;; Changed to "C-c h". Note: We must set "C-c h" globally, because we
;; cannot change `helm-command-prefix-key' once `helm-config' is loaded.
(global-set-key (kbd "C-c h") 'helm-command-prefix)
(global-unset-key (kbd "C-x c"))

(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebind tab to run persistent action
(define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB works in terminal
(define-key helm-map (kbd "C-z")  'helm-select-action) ; list actions using C-z

(when (executable-find "curl")
  (setq helm-google-suggest-use-curl-p t))

(setq helm-split-window-in-side-p           t ; open helm buffer inside current window, not occupy whole other window
      helm-move-to-line-cycle-in-source     t ; move to end or beginning of source when reaching top or bottom of source.
      helm-ff-search-library-in-sexp        t ; search for library in `require' and `declare-function' sexp.
      helm-scroll-amount                    8 ; scroll 8 lines other window using M-<next>/M-<prior>
      helm-ff-file-name-history-use-recentf t)

(global-set-key (kbd "C-x b") 'helm-mini)
(setq helm-buffers-fuzzy-matching t
      helm-recentf-fuzzy-match    t)

(global-set-key (kbd "M-x") 'helm-M-x)
(setq helm-M-x-fuzzy-match t) ;; optional fuzzy matching for helm-M-x

(global-set-key (kbd "M-y") 'helm-show-kill-ring)
(global-set-key (kbd "C-x C-f") 'helm-find-files)

;; most commonly used key bindings
;; prefix i => `helm-semantic-or-imenu'
;; prefix m => `helm-man-woman'
;; prefix / => `helm-find'
;; prefix l => `helm-locate'
;; prefix r => `helm-regexp'
;; prefix t => `helm-top'
;; prefix C-, => `helm-calcul-expression'
(global-set-key (kbd "C-c h o") 'helm-occur)
(global-set-key (kbd "C-c h b") 'helm-bibtex)

;; helm-bibtex config
(setq helm-bibtex-bibliography '("~/快盘/jabref/ref.bib"))
(setq helm-bibtex-pdf-field "File")
(setq helm-bibtex-pdf-symbol "⌘")
(setq helm-bibtex-notes-symbol "✎")
(setq helm-bibtex-notes-path "~/快盘/jabref/notes.org")
(setq helm-bibtex-pdf-open-function 'open-file-externally)


(setq helm-bibtex-format-citation-functions
      '((org-mode      . helm-bibtex-format-citation-org-link-to-PDF)
        (latex-mode    . helm-bibtex-format-citation-cite)
        (markdown-mode . helm-bibtex-format-citation-pandoc-citeproc)
        (default       . helm-bibtex-format-citation-default)))

(add-hook 'eshell-mode-hook '(lambda()
                               (local-set-key (kbd "C-c C-l") 'helm-eshell-history)))

(helm-mode 1)

(projectile-global-mode)
(setq projectile-completion-system 'helm)
(helm-projectile-on)

(provide 'init-helm)
