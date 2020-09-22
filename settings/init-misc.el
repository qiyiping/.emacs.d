;;; init-misc.el --- goodies

;; gc settings
(setq gc-cons-threshold 100000000)

;; window resize key bindings
;; `enlarge-window': C-x ^
;; `enlarge-window-horizontally': C-x }
;; `shrink-window-horizontally': C-x {

(defalias 'yes-or-no-p 'y-or-n-p)

(random t)

;; Chinese calendar
(require 'cal-china-x)
(setq mark-holidays-in-calendar t)
(setq cal-china-x-important-holidays cal-china-x-chinese-holidays)
(setq calendar-holidays cal-china-x-important-holidays)

;; Dictionary
(if (eq system-type 'darwin)
    (global-set-key (kbd "C-c d") 'osx-dictionary-search-pointer)
  (global-set-key (kbd "C-c d") 'dictionary-lookup-definition))
(setq dictionary-default-dictionary "wn")


;; cheat.sh
(global-set-key (kbd "C-c c") 'cheat-sh)

;; leatcode.el
(setq leetcode-prefer-language "python3")
(setq leetcode-prefer-sql "mysql")

(defun select-random-leetcode-problem ()
  (interactive)
  (let ((number-of-lines (line-number-at-pos (point-max))))
    (goto-line (+ 1 (random number-of-lines)))
    (leetcode-show-current-problem)))

;; Tramp
(require 'tramp)
(setq tramp-default-method "ssh")

;; Allow Emacs to be a server for client processes
;; use `save-buffers-kill-emacs' to quit emacs server.
;; key binding: s-q
(require 'server)
(unless (server-running-p) (server-start))

;; browser support
(global-set-key [f8] 'browse-url-at-point)

(defun my-set-eww-buffer-title ()
  (let* ((title  (plist-get eww-data :title))
         (url    (plist-get eww-data :url))
         (result (concat "*eww-" (or title
                              (if (string-match "://" url)
                                  (substring url (match-beginning 0))
                                url)) "*")))
    (rename-buffer result t)))

(add-hook 'eww-after-render-hook 'my-set-eww-buffer-title)

;; sudo edit
(defun sudo-edit ()
  (interactive)
  (if (buffer-file-name)
      (find-alternate-file (concat "/sudo::" (buffer-file-name)))
    (find-file (concat "/sudo::" (read-file-name "File: ")))))

;; erc
(setq erc-server "irc.freenode.net")
(setq erc-port 8000)
(setq erc-nick "qyp")
(setq erc-track-exclude-types '("JOIN" "NICK" "PART" "QUIT" "MODE"
                                "324" "329" "332" "333" "353" "477"))
(setq erc-hide-list '("JOIN" "PART" "QUIT" "NICK"))

;; timer task
(defvar my-take-a-break-timer
  nil)

(defun my-take-a-break-function ()
  (with-output-to-temp-buffer "*TAKE A BREAK*"
    (print (concat
            (current-time-string)
            "    TAKE A BREAK & DRINK SOME WATER"))))

(defun my-setup-take-a-break-timer ()
  (if (not my-take-a-break-timer)
      (setq my-take-a-break-timer
            (run-with-timer 3600 3600 'my-take-a-break-function))))

(defun my-toggle-take-a-break ()
  (interactive)
  (if my-take-a-break-timer
      (progn
        (cancel-timer my-take-a-break-timer)
        (setq my-take-a-break-timer nil))
    (my-setup-take-a-break-timer)))

;; (my-setup-take-a-break-timer)

(provide 'init-misc)
