;;; init-bibtex.el --- bibtex settings

;; helm-bibtex config
(global-set-key (kbd "C-c h b") 'helm-bibtex)

(defvar my-bibtex-database
  "~/kuaipan/jabref/refs.bib"
  "BibTeX database")

(defvar my-bibtex-notes
  "~/kuaipan/jabref/notes.org"
  "BibTeX notes")

(setq bibtex-completion-bibliography (list my-bibtex-database))
(setq bibtex-completion-notes-path my-bibtex-notes)

(setq bibtex-completion-pdf-field "File")
(setq bibtex-completion-pdf-symbol "⌘")
(setq bibtex-completion-notes-symbol "✎")
(setq bibtex-completion-pdf-open-function 'open-file-externally)

(setq bibtex-completion-additional-search-fields '(tags))

(setq bibtex-completion-format-citation-functions
  '((org-mode      . bibtex-completion-format-citation-org-link-to-PDF)
    (latex-mode    . bibtex-completion-format-citation-cite)
    (markdown-mode . bibtex-completion-format-citation-pandoc-citeproc)
    (default       . bibtex-completion-format-citation-default)))

;; basic bibtex-mode setting
(setq bibtex-align-at-equal-sign t)

(add-hook 'bibtex-mode-hook
          (lambda ()
            (set-fill-column 150)))

;; find paper file path by projectile
(defvar my-paper-directory
  "/Users/qiyiping/kuaipan/paper/"
  "Paper directory")

(defun my-insert-pdf-path ()
  (interactive)
  (let ((default-directory my-paper-directory))
    (let ((file (projectile-completing-read "Find file: "
                                      (projectile-current-project-files))))
      (insert (expand-file-name file (projectile-project-root))))))

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
