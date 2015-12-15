;;; init-bibtex.el --- bibtex settings

;; helm-bibtex config
(global-set-key (kbd "C-c h b") 'helm-bibtex)

(defvar my-bibtex-database
  "~/快盘/jabref/refs.bib"
  "BibTeX database")

(defvar my-bibtex-notes
  "~/快盘/jabref/notes.org"
  "BibTeX notes")

(setq helm-bibtex-bibliography (list my-bibtex-database))
(setq helm-bibtex-notes-path my-bibtex-notes)

(setq helm-bibtex-pdf-field "File")
(setq helm-bibtex-pdf-symbol "⌘")
(setq helm-bibtex-notes-symbol "✎")
(setq helm-bibtex-pdf-open-function 'open-file-externally)

(setq helm-bibtex-additional-search-fields '(tags))

(setq helm-bibtex-format-citation-functions
      '((org-mode      . helm-bibtex-format-citation-org-link-to-PDF)
        (latex-mode    . helm-bibtex-format-citation-cite)
        (markdown-mode . helm-bibtex-format-citation-pandoc-citeproc)
        (default       . helm-bibtex-format-citation-default)))

(setq bibtex-align-at-equal-sign t)

(add-hook 'bibtex-mode-hook
          (lambda ()
            (set-fill-column 150)))

(require 'gscholar-bibtex)
(setq gscholar-bibtex-database-file my-bibtex-database)
(setq gscholar-bibtex-default-source "Google Scholar")

(defun gscholar-bibtex-write-bibtex-to-database ()
  (interactive)
  (warn "write-bibtex-to-database is disabled!"))

(provide 'init-bibtex)
