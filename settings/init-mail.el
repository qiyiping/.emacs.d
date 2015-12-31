;;; init-mail.el --- mail settings

(setq user-full-name "Yiping Qi"
      user-mail-address "qiyiping@outlook.com")

;; send mail
(setq message-send-mail-function 'smtpmail-send-it
      send-mail-function 'smtpmail-send-it
      smtpmail-default-smtp-server "smtp-mail.outlook.com"
      smtpmail-smtp-service 587)

;; receive mail
;; ;; http://www.emacswiki.org/emacs/GnusTutorial

;; (require 'gnus)
;; (require 'nnir)

;; (setq gnus-use-cache t)

;; ;; gnus guide: https://github.com/redguardtoo/mastering-emacs-in-one-year-guide/blob/master/gnus-guide-en.org
;; ;; gnupg tutorial: http://www.williamlong.info/archives/3439.html

;; ;; mail settings
;; (setq gnus-select-method
;;       '(nnimap "outlook"
;;                (nnimap-address "imap-mail.outlook.com")
;;                (nnimap-server-port 993)
;;                (nnimap-stream ssl)))


(provide 'init-mail)
