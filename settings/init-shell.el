;;; init-shell.el --- shell/eshell settings

;;; eshell settings
;;; eshell clear http://www.khngai.com/emacs/eshell.php
(defun eshell-clear ()
  (interactive)
  (let ((inhibit-read-only t))
    (erase-buffer)
    (eshell-send-input)))

(add-hook 'eshell-mode-hook '(lambda ()
			       (local-set-key (kbd "C-l") 'eshell-clear)))

(defun my-git-branch ()
  (let ((branch (shell-command-to-string
                 "git branch --no-color 2>/dev/null | sed -n 's/^\\* \\(.*\\)/ → \\1/'p")))
    (replace-regexp-in-string (rx (* (any " \t\n")) eos)
                              ""
                              branch)))

(setq eshell-prompt-function
      (function
       (lambda ()
         (concat (abbreviate-file-name (eshell/pwd))
                 (if (not (eq system-type 'windows-nt))
                     (my-git-branch)
                   "")
                 (if (= (user-uid) 0) " # " " $ ")))))

;;; eshell is my favorite
(global-set-key (kbd "C-c C-t") (lambda ()
                                  (interactive)
                                  (eshell 't)))

;;; shell mode settings
(defun shell-clear ()
  (interactive)
  (let ((comint-buffer-maximum-size 0))
    (comint-truncate-buffer)))

(add-hook 'shell-mode-hook '(lambda ()
			      (local-set-key (kbd "C-l") 'shell-clear)))

;;; multi-term
(setq multi-term-program "/bin/bash")

(provide 'init-shell)
