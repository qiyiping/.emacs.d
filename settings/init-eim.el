;;; init-eim.el --- emacs input method settings

(add-to-list 'load-path "~/.emacs.d/vendor/eim/")

(autoload 'eim-use-package "eim" "Another emacs input method")

(setq eim-use-tooltip nil)
(setq eim-wb-use-gbk t)

(register-input-method
 "eim-wb" "euc-cn" 'eim-use-package
 "五笔" "汉字五笔输入法" "wb.txt")
(register-input-method
 "eim-py" "euc-cn" 'eim-use-package
 "拼音" "汉字拼音输入法" "py.txt")

(require 'eim-extra)
(global-set-key ";" 'eim-insert-ascii)

(setq default-input-method 'eim-py)
;; (setq default-input-method 'eim-wb)

(provide 'init-eim)
