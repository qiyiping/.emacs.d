;;; init-eim.el --- emacs input method settings

(add-to-list 'load-path "~/.emacs.d/vendor/eim/")

(autoload 'eim-use-package "eim" "Another emacs input method")

(register-input-method
 "eim-wb" "euc-cn" 'eim-use-package
 "���" "����������뷨" "wb.txt")
(register-input-method
 "eim-py" "euc-cn" 'eim-use-package
 "ƴ��" "����ƴ�����뷨" "py.txt")

(require 'eim-extra)
(global-set-key ";" 'eim-insert-ascii)

(setq eim-use-tooltip nil)
(setq eim-wb-use-gbk t)

(setq eim-wb-history-file "~/.emacs.d/eim-wb-history")
(setq eim-wb-user-file "~/.emacs.d/eim-wb-user")

(setq default-input-method 'eim-py)
;; (setq default-input-method 'eim-wb)

(provide 'init-eim)
