;;; init-shell.el --- shell/eshell settings

;;; eshell clear http://www.khngai.com/emacs/eshell.php
(defun eshell-clear ()
  (interactive)
  (let ((inhibit-read-only t))
    (erase-buffer)
    (eshell-send-input)))

(add-hook 'eshell-mode-hook '(lambda ()
			       (local-set-key (kbd "C-l") 'eshell-clear)))

(defun shell-clear ()
  (interactive)
  (let ((old-max comint-buffer-maximum-size))
    (setq comint-buffer-maximum-size 0)
    (comint-truncate-buffer)
    (setq comint-buffer-maximum-size old-max)))

(add-hook 'shell-mode-hook '(lambda ()
			      (local-set-key (kbd "C-l") 'shell-clear)))

;;; multi-term
(setq multi-term-program "/bin/bash")

;; eshell is my favorite
(global-set-key (kbd "C-c C-t") (lambda ()
                                  (interactive)
                                  (eshell 't)))

(provide 'init-shell)
