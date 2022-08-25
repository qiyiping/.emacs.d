;;; init-dired.el --- dired config

(require 'dired)
(require 'dired-x)
;; (require 'dired+)
(put 'dired-find-alternate-file 'disabled nil)
(setq dired-dwim-target t)
(setq dired-listing-switches "-lah")
(setq dired-omit-files "^\\.?#\\|^\\.$\\|^\\.\\.$\\|^\\..*$")
(setq-default dired-omit-files-p t)

;; open file externally
(defun open-file-externally (file-name)
  (cond
   ((eq system-type 'windows-nt)
    (w32-shell-execute "open" file-name))
   ((eq system-type 'darwin)
    (shell-command (format "open \"%s\"" file-name)))
   ((eq system-type 'gnu/linux)
    (let ((process-connection-type nil))
      (start-process "" nil "xdg-open" file-name)))))

(defun my-dired-find-file (&optional prefix)
  (interactive "P")
  (if prefix
      (open-file-externally (dired-get-file-for-visit))
    (dired-find-file)))
(define-key dired-mode-map "\r" 'my-dired-find-file)

(define-key dired-mode-map (kbd "k") 'dired-kill-subdir)


(require 'dirtree)

(provide 'init-dired)
