;;; init-misc.el --- goodies

;; Revert buffer w/o confirm
(defun revert-buffer-no-confirm ()
  "Revert buffer without confirmation."
  (interactive)
  (revert-buffer t t))
(global-set-key [f5] 'revert-buffer-no-confirm)

;; windmove
(windmove-default-keybindings 'meta)
(setq windmove-wrap-around t)

;; rotate windows
;; http://whattheemacsd.com/
(defun rotate-windows ()
  "Rotate windows"
  (interactive)
  (cond ((not (> (count-windows) 1))
         (message "You can't rotate a single window!"))
        (t
         (setq i 1)
         (setq n (count-windows))
         (while (< i n)
           (let* ((w1 (elt (window-list) i))
                  (w2 (elt (window-list) (+ (% i n) 1)))

                  (b1 (window-buffer w1))
                  (b2 (window-buffer w2))

                  (s1 (window-start w1))
                  (s2 (window-start w2)))
             (set-window-buffer w1  b2)
             (set-window-buffer w2 b1)
             (set-window-start w1 s2)
             (set-window-start w2 s1)
             (setq i (1+ i)))))))
(global-set-key (kbd "M-R") 'rotate-windows)

;; ace jump mode
(autoload
  'ace-jump-mode
  "ace-jump-mode"
  "Emacs quick move minor mode"
  t)
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)

;; window resize key bindings
;; `enlarge-window': C-x ^
;; `enlarge-window-horizontally': C-x }
;; `shrink-window-horizontally': C-x {

(defalias 'yes-or-no-p 'y-or-n-p)

(random t)

;; Chinese calendar
(require 'cal-china-x)
(setq mark-holidays-in-calendar t)
(setq cal-china-x-priority1-holidays cal-china-x-chinese-holidays)
(setq calendar-holidays cal-china-x-priority1-holidays)

;; Tramp
(require 'tramp)
(setq tramp-default-method "ssh")

;; Allow Emacs to be a server for client processes
;; (server-start)

(defun kill-emacs-server ()
  "Save buffers and kill emacs server"
  (interactive)
  (save-some-buffers)
  (kill-emacs))

(global-set-key [f8] 'browse-url-at-point)

;; Use M-SPC in windows to set mark
(when (eq system-type 'windows-nt)
  (global-set-key (kbd "M-SPC") 'set-mark-command))

;; sudo edit
(defun sudo-edit ()
  (interactive)
  (if (buffer-file-name)
      (find-alternate-file (concat "/sudo::" (buffer-file-name)))
    (find-file (concat "/sudo::" (ido-read-file-name "File: ")))))

;; erc
(setq erc-server "irc.freenode.net")
(setq erc-port 8000)
(setq erc-nick "qyp")

(erc-track-mode t)
(setq erc-track-exclude-types '("JOIN" "NICK" "PART" "QUIT" "MODE"
                                "324" "329" "332" "333" "353" "477"))
(setq erc-hide-list '("JOIN" "PART" "QUIT" "NICK"))

(provide 'init-misc)
