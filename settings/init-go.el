;;; init-go.el golang settings

(defun my-go-mode-setup ()
  (go-eldoc-setup)
  (set (make-local-variable 'compile-command)
       "go build -v && go test -v && go vet")
  (local-set-key (kbd "M-.") 'godef-jump)
  (setq gofmt-command "goimports")
  (add-hook 'before-save-hook 'gofmt-before-save))

(add-hook 'go-mode-hook 'my-go-mode-setup)

;; (require 'go-autocomplete)

(provide 'init-go)
