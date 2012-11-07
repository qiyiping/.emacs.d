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

;; window resize key bindings
;; `enlarge-window': C-x ^
;; `enlarge-window-horizontally': C-x }
;; `shrink-window-horizontally': C-x {

(defalias 'yes-or-no-p 'y-or-n-p)

(random t)

;; chinese calendar
(require 'cal-china-x)
(setq mark-holidays-in-calendar t)
(setq cal-china-x-priority1-holidays cal-china-x-chinese-holidays)
(setq calendar-holidays cal-china-x-priority1-holidays)

(provide 'init-misc)
