;;; init-markdown.el --- load markdown mode

(autoload 'markdown-mode "markdown-mode.el"
  "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist
             '("\\.\\(md\\|markdown\\)$" . markdown-mode)
             t)

(provide 'init-markdown)
