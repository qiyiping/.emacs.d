;;; init-lua.el --- lua settings

(autoload 'lua-mode "lua-mode" "Lua editing mode." t)
(add-to-list 'auto-mode-alist '("\\.lua$" . lua-mode))
(add-to-list 'interpreter-mode-alist '("lua" . lua-mode))

(if (executable-find "th")
    (setq lua-default-application "th"))

(defun get-torch-help(stm)
  (if (executable-find "th")
      (shell-command-to-string (format "th ~/.emacs.d/settings/lua_help.lua %s" stm))
    "`th' command is not found. Please make sure that `Torch' is installed."))

(defvar torch-stm-regexp
  "[a-zA-Z0-9\\.\\-]+")

(defun get-torch-help-at-point(stm)
  (interactive (list
                (let ((current-stm (current-regexp-at-point torch-stm-regexp)))
                  (read-string (format "statement: (%s)" current-stm)
                               ""
                               nil
                               current-stm))))
  (message stm)
  (with-output-to-temp-buffer "*Torch Help*"
    (print (get-torch-help stm)))
  (my-ansi-color-apply-buffer (get-buffer "*Torch Help*")))

(provide 'init-lua)
