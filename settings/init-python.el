;;; init-python.el --- python settings

;; ;; Use python.el from http://github.com/fgallina/python.el
;; ;; Use the master branch in emacs24 and the emacs23 branch in emacs23
;; (require 'python)

;; (add-hook 'python-mode-hook 'jedi:setup)

(add-to-list 'auto-mode-alist '("SConstruct\\'" . python-mode))
(add-to-list 'auto-mode-alist '("YBUILD\\'" . python-mode))

(setq
 python-shell-interpreter "ipython"
 python-shell-interpreter-args ""
 python-shell-prompt-regexp "In \\[[0-9]+\\]: "
 python-shell-prompt-output-regexp "Out\\[[0-9]+\\]: "
 python-shell-completion-setup-code
 "from IPython.core.completerlib import module_completion"
 python-shell-completion-module-string-code
 "';'.join(module_completion('''%s'''))\n"
 python-shell-completion-string-code
 "';'.join(get_ipython().Completer.all_completions('''%s'''))\n")

(setq python-eldoc-setup-code
  "def __PYDOC_get_help(obj):
    try:
        doc = help(obj)
    except:
        doc = ''
    try:
        exec('print doc')
    except SyntaxError:
        print(doc)"
  )

(defun my-pythondoc-at-point (symbol)
  (interactive
   (let ((symbol (python-info-current-symbol t))
         (enable-recursive-minibuffers t))
     (list (read-string (if symbol
                            (format "Describe symbol (default %s): " symbol)
                          "Describe symbol: ")
                        nil nil symbol))))

  (with-output-to-temp-buffer "PYDOC"
    (print (python-eldoc--get-doc-at-point symbol))))

(defun my-python-shell-buffer ()
  (get-buffer (format "*%s*" python-shell-buffer-name)))

(defun my-switch-to-python-shell ()
  (let ((python-shell-buffer (my-python-shell-buffer)))
    (if python-shell-buffer
        (progn
          (setq my-python-file-buffer (current-buffer))
          (switch-to-buffer python-shell-buffer))
      (message "no python shell is running"))))

(defun my-switch-to-python-file ()
  (if my-python-file-buffer
      (switch-to-buffer my-python-file-buffer)))

(defun my-switch-python-file-shell ()
  (interactive)
  (if (eq (current-buffer) (my-python-shell-buffer))
      (my-switch-to-python-file)
    (my-switch-to-python-shell)))

(defvar my-python-file-buffer
  nil
  "current python buffer")

(add-hook 'python-mode-hook
          '(lambda ()
             (local-set-key (kbd "C-c C-f") 'my-pythondoc-at-point)
             (local-set-key (kbd "C-c o") 'my-switch-python-file-shell)))

(add-hook 'inferior-python-mode-hook
          '(lambda ()
             (local-set-key (kbd "C-c C-f") 'my-pythondoc-at-point)
             (local-set-key (kbd "C-c o") 'my-switch-python-file-shell)))


(provide 'init-python)
