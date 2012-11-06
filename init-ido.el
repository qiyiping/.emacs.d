;;; init-ido.el --- ido mode settings

(ido-mode t)
(ido-ubiquitous t)

(setq ido-enable-flex-matching t
      ido-auto-merge-work-directories-length 0
      ido-create-new-buffer 'always
      ido-use-filename-at-point 'guess
      ido-use-virtual-buffers t
      ido-default-buffer-method 'selected-window)


(smex-initialize)
(global-set-key "\M-x" 'smex)

(provide 'init-ido)
