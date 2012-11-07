;;; init-yasnippet.el -- yasnippet settings
(require 'yasnippet)
(yas-global-mode t)

;; remove the annoying yas/x-prompt
(setq yas/prompt-functions '(yas/dropdown-prompt
			     yas/ido-prompt
			     yas/completing-prompt))

(provide 'init-yasnippet)
