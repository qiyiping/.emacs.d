;;; init-rust.el rust lang settings

;; requirements:
;; rust language server - https://github.com/rust-lang/rls
;;     rustup update
;;     rustup component add rls rust-analysis rust-src


(require 'rust-mode)

(add-hook 'rust-mode-hook
          (lambda () (setq indent-tabs-mode nil)))
(add-hook 'rust-mode-hook 'cargo-minor-mode)

(add-to-list 'eglot-server-programs
             '(rust-mode "rust-analyzer"))
(add-hook 'rust-mode-hook 'eglot-ensure)

(setq rust-format-on-save t)

(provide 'init-rust)
