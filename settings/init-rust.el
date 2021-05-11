;;; init-rust.el rust lang settings

(require 'rust-mode)

(add-hook 'rust-mode-hook
          (lambda () (setq indent-tabs-mode nil)))
(add-hook 'rust-mode-hook 'cargo-minor-mode)

(setq rust-format-on-save t)

(provide 'init-rust)
