;;; init-ido.el --- ido mode settings

;; ido mode key bindings:
;; // - go to the root directory.
;; ~/ - go to the home directory.
;; C-f - to go back temporarily to the normal find-file.
;; C-d - enter Dired for this directory (used to be C-x C-d in older versions)
;; C-j - create a new file named with the text you entered
;; while using `c-x c-f' to open file, use `c-x d' to open dir
(ido-mode t)
(ido-everywhere t)

(setq ido-enable-flex-matching t
      ido-auto-merge-work-directories-length 0
      ido-create-new-buffer 'always
      ido-use-filename-at-point 'guess
      ido-use-virtual-buffers t
      ido-default-buffer-method 'selected-window)


(smex-initialize)
(global-set-key "\M-x" 'smex)

;; (recentf-mode t)

(provide 'init-ido)
