;;; init-package.el --- set up the package manager

;; (setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
;;                          ("melpa" . "https://melpa.org/packages/")
;;                          ("melpa-stable" . "https://stable.melpa.org/packages/")))

(setq package-archives '(("gnu" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
                         ("org" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/org/")
                         ("melpa-stable" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/stable-melpa/")
                         ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")))

(setq package-archive-priorities '(("gnu" . 10)
				   ("melpa-stable" . 7)
				   ("org" . 5)
				   ("melpa" . 1)))

(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

;; (package-install-selected-packages)

(provide 'init-package)
