;;; init-isearch.el --- isearch settings

(require 'thingatpt)
;; Search at point
;; http://www.emacswiki.org/emacs/SearchAtPoint
(defun isearch-yank-symbol ()
  "Put symbol at current point into search string."
  (interactive)
  (let ((sym (symbol-at-point)))
    (if sym
        (progn
          (setq isearch-regexp t
                isearch-string (concat "\\_<" (regexp-quote (symbol-name sym)) "\\_>")
                isearch-message (mapconcat 'isearch-text-char-description isearch-string "")
                isearch-yank-flag t))
      (ding)))
  (isearch-search-and-update))

;; Use `C-s C-w' to search the current symbol
(add-hook 'isearch-mode-hook
          (lambda ()
            "Activate customized Isearch word yank command."
            (substitute-key-definition 'isearch-yank-word-or-char
                                       'isearch-yank-symbol
                                       isearch-mode-map)))

(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "C-r") 'isearch-backward-regexp)
(global-set-key (kbd "C-M-s") 'isearch-forward)
(global-set-key (kbd "C-M-r") 'isearch-backward)

(provide 'init-isearch)
