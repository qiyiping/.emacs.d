;;; init-lua.el --- lua settings

(autoload 'lua-mode "lua-mode" "Lua editing mode." t)
(add-to-list 'auto-mode-alist '("\\.lua$" . lua-mode))
(add-to-list 'interpreter-mode-alist '("lua" . lua-mode))

(if (executable-find "th")
    (setq lua-default-application "th"))


(provide 'init-lua)
