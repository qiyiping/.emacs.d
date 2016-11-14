;;; init-bibtex.el --- bibtex settings

;; helm-bibtex config
(global-set-key (kbd "C-c h b") 'helm-bibtex)

(defvar my-bibtex-database
  "~/kuaipan/jabref/refs.bib"
  "BibTeX database")

(defvar my-bibtex-notes
  "~/kuaipan/jabref/notes.org"
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

;; basic bibtex-mode setting
(setq bibtex-align-at-equal-sign t)

(add-hook 'bibtex-mode-hook
          (lambda ()
            (set-fill-column 150)))

(defun my-insert-pdf-path ()
  (interactive)
  (insert (read-file-name "File: " "~/kuaipan/paper/")))

;; google scholar for bibtex retrieval
(require 'gscholar-bibtex)
(setq gscholar-bibtex-default-source "Google Scholar")
(setq gscholar-bibtex-database-file my-bibtex-database)

;; override `gscholar-bibtex-write-bibtex-to-database'
(defun gscholar-bibtex-write-bibtex-to-database ()
  (interactive)
  (gscholar-bibtex--write-bibtex-to-database-impl t))

;; issue: https://github.com/cute-jumper/gscholar-bibtex/issues/10
(defun gscholar-bibtex--url-retrieve-as-buffer (url)
  (let* ((url-request-extra-headers
          `(("User-Agent" . ,gscholar-bibtex-user-agent-string)
            ("Cookie" . "GSP=ID=87969bbbc5530bab:CF=4")))
         (response-buffer (url-retrieve-synchronously url)))
    (with-current-buffer response-buffer
      (gscholar-bibtex--delete-response-header)
      (set-buffer-multibyte t))
    response-buffer))

(global-set-key (kbd "C-c g") 'gscholar-bibtex)

(provide 'init-bibtex)
