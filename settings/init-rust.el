;;; init-rust.el rust lang settings

;; requirements:
;; rust language server - https://github.com/rust-lang/rls
;;     rustup update
;;     rustup component add rls rust-analysis rust-src


(require 'rust-mode)

(add-hook 'rust-mode-hook
          (lambda () (setq indent-tabs-mode nil)))
(add-hook 'rust-mode-hook 'cargo-minor-mode)

(setq rust-format-on-save t)

(provide 'init-rust)
