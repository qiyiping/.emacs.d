;;; init-programming.el --- general programming settings

;; (global-set-key (kbd "C-c M") 'comment-region)
(global-set-key [f7] 'compile)

;; smart-compile+ package
;; smart-compile & smart-run
(require 'smart-compile+)

(setq gdb-many-windows t)
(which-function-mode t)

(require 'xcscope)
(cscope-setup)

(defun programming-cleanup-buffer ()
  (interactive)
  (untabify (point-min) (point-max))
  (indent-region (point-min) (point-max))
  (delete-trailing-whitespace))

(global-set-key (kbd "C-c C") 'programming-cleanup-buffer)

(defvar programming-mode-hooks '(c-mode-common-hook
                                 python-mode-hook
                                 perl-mode-hook
                                 emacs-lisp-mode-hook
                                 scheme-mode-hook
                                 sh-mode-hook)
  "Programming mode hook")

(defun programming-common-settings ()
  (setq indent-tabs-mode nil)
  (setq show-trailing-whitespace t)
  (rainbow-delimiters-mode t)
  (idle-highlight-mode t))

(if (> emacs-major-version 23)
    (add-hook 'prog-mode-hook 'programming-common-settings)
  (dolist (mode-hook programming-mode-hooks)
    (add-hook mode-hook 'programming-common-settings)))

;; imenu settings
(setq-default imenu-auto-rescan t)

;; (defvar programming-imenu-positions
;;   '()
;;   "imenu jump stack")

;; (defun programming-imenu-jump ()
;;   (interactive)
;;   (let ((pos (point)))
;;     (unless (eq (car programming-imenu-positions) pos)
;;       (push pos programming-imenu-positions)))
;;   (call-interactively 'imenu))

;; (defun programming-imenu-jump-back ()
;;   (interactive)
;;   (let ((pos (pop programming-imenu-positions)))
;;     (if pos
;;         (goto-char pos)
;;       (message "imenu jump stack is empty"))))

;; (global-set-key (kbd "C-x i") 'programming-imenu-jump)
;; (global-set-key (kbd "C-x p") 'programming-imenu-jump-back)

;; other useful programming modes
(require 'thrift-mode)
(require 'protobuf-mode)
(add-to-list 'auto-mode-alist '("\\.proto\\'" . protobuf-mode))

;; project explorer
(setq pe/width 30)
(global-set-key (kbd "C-c e") 'project-explorer-toggle)


;; ;; lsp mode default settings
;; (setq lsp-ui-sideline-delay 1.0)

(require 'eglot)
(setq eglot-ignored-server-capabilites '(:documentHighlightProvider))


(use-package aider
  :config
  ;; For latest claude sonnet model
  (setq aider-args '("--model" "deepseek/deepseek-chat" "--no-auto-accept-architect")) ;; add --no-auto-commits if you don't want it
  ;; (setenv "ANTHROPIC_API_KEY" anthropic-api-key)
  ;; Or chatgpt model
  ;; (setq aider-args '("--model" "o4-mini"))
  ;; (setenv "OPENAI_API_KEY" <your-openai-api-key>)
  ;; Or use your personal config file
  ;; (setq aider-args `("--config" ,(expand-file-name "~/.aider.conf.yml")))
  ;; ;;
  ;; Optional: Set a key binding for the transient menu
  (global-set-key (kbd "C-c a") 'aider-transient-menu) ;; for wider screen
  ;; or use aider-transient-menu-2cols / aider-transient-menu-1col, for narrow screen
  (aider-magit-setup-transients) ;; add aider magit function to magit menu
  ;; auto revert buffer
  (global-auto-revert-mode 1)
  (auto-revert-mode 1))


(gptel-make-deepseek "DeepSeek"       ;Any name you want
  :stream t                           ;for streaming responses
  :key (lambda() (getenv "DEEPSEEK_API_KEY")))               ;can be a function that returns the key

(provide 'init-programming)
