;;; init-mail.el --- mail settings

(setq user-full-name "Yiping Qi"
      user-mail-address "qiyiping@outlook.com")

(setq message-send-mail-function 'smtpmail-send-it
      send-mail-function 'smtpmail-send-it
      smtpmail-default-smtp-server "smtp-mail.outlook.com"
      smtpmail-smtp-service 587)

(provide 'init-mail)
