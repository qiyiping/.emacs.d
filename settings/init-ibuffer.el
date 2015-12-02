;;; init-ibuffer.el --- Ibuffer settings

(require 'ibuffer)

(setq ibuffer-saved-filter-groups
      (quote (("default"
               ("Dired" (mode . dired-mode))
               ("Shell" (or
                         (mode . shell-mode)
                         (mode . eshell-mode)
                         (mode . term-mode)
                         (mode . inferior-python-mode)))
               ("Programming" (or
                               (mode . c-mode)
                               (mode . c++-mode)
                               (mode . perl-mode)
                               (mode . cperl-mode)
                               (mode . python-mode)
                               (mode . emacs-lisp-mode)
                               (mode . inferior-ess-mode)
                               (mode . sh-mode)
                               (mode . lua-mode)
                               (mode . scala-mode)
                               (mode . java-mode)
                               (name . "^\\*R\\*$")
                               (filename . ".*[Mm]akefile")
                               (mode . makefile-mode)))
               ("Emacs" (or
                         (name . "^\\*scratch\\*$")
                         (name . "^\\*Messages\\*$")
                         (name . "^\\*ESS\\*$")
                         (name . "^\\*Bookmark List\\*$")))
               ("Org" (or
                       (mode . org-mode)
                       (name . "^\\*Calendar\\*$")
                       (name . "^diary$")))
               ("IDL" (or
                       (mode . protobuf-mode)
                       (mode . thrift-mode)))
               ("Mail" (or
                        (mode . message-mode)
                        (mode . mail-mode)
                        (mode . bbdb-mode)
                        (mode . gnus-group-mode)
                        (mode . gnus-summary-mode)
                        (mode . gnus-article-mode)
                        (name . "^\\.bbdb$")
                        (name . "^\\.newsrc-dribble")))
               ("TeX" (or
                       (filename . ".*.tex")))
               ("Help" (or
                        (mode . Info-mode)
                        (mode . Man-mode)
                        (mode . help-mode)))
               ("ERC" (or
                       (mode . erc-mode)
                       (mode . erc-list-mode)))))))

(setq ibuffer-sorting-mode major-mode)
(setq ibuffer-formats '((mark modified
                              read-only
                              " "
                              (name 31 31 :left :elide)
                              " "
                              (size 9 -1 :right)
                              " "
                              (mode 16 16 :left :elide)
                              " "
                              filename-and-process)))

(add-hook 'ibuffer-mode-hook
          (lambda ()
            (ibuffer-auto-mode 1)
            (ibuffer-switch-to-saved-filter-groups "default")))
(global-set-key (kbd "C-x C-b") 'ibuffer)

(provide 'init-ibuffer)
