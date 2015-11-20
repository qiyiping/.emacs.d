;;; init-lua.el --- lua settings

(autoload 'lua-mode "lua-mode" "Lua editing mode." t)
(add-to-list 'auto-mode-alist '("\\.lua$" . lua-mode))
(add-to-list 'interpreter-mode-alist '("lua" . lua-mode))

(if (executable-find "th")
    (setq lua-default-application "th"))

(defun get-torch-help(stm)
  (if (executable-find "th")
      (shell-command-to-string
       (format "th ~/.emacs.d/settings/lua_help.lua %s" stm))
    "`th' command is not found. Please make sure that `Torch' is installed."))

(defvar torch-stm-regexp
  "[a-zA-Z0-9\\.\\-]+")

(defun get-torch-help-at-point(stm)
  "Get Torch document for the statement at the point."
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

(setq my-lua-doc-path
      (concat "file://"
              (file-name-as-directory (expand-file-name "~"))
              ".emacs.d/doc/lua/lua-manual.html"))

(defun my-get-lua-documentation (funcname)
  "Search Lua documentation for the word at the point."
  (interactive (list
                (let ((current-funcname (lua-funcname-at-point)))
                  (read-string (format "function name: (%s)" current-funcname)
                               ""
                               nil
                               current-funcname))))
  (message funcname)
  (if (> (length funcname) 0)
      (eww (concat my-lua-doc-path "#pdf-" funcname))
    (message "Cannot find function at point")))

(provide 'init-lua)

