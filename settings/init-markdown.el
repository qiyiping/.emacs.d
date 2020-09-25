;;; init-markdown.el --- load markdown mode

(autoload 'markdown-mode "markdown-mode.el"
  "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist
             '("\\.\\(md\\|markdown\\)$" . markdown-mode)
             t)

(setq markdown-command "pandoc")

(defun my-markdown-preview (&optional output-buffer-name)
  "Run `markdown-command' on the current buffer and view output in browser.
When OUTPUT-BUFFER-NAME is given, insert the output in the buffer with
that name."
  (interactive)
  (let ((browse-url-browser-function 'eww-browse-url))
    (browse-url-of-buffer
     (markdown-standalone (or output-buffer-name markdown-output-buffer-name)))))

(provide 'init-markdown)
