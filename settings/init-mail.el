;;; init-mail.el --- mail settings

(setq message-send-mail-function 'smtpmail-send-it
      send-mail-function 'smtpmail-send-it
      smtpmail-default-smtp-server "smtp-mail.outlook.com"
      smtpmail-smtp-service 587)

(provide 'init-mail)
