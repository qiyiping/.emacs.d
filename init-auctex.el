;;; init-auctex.el --- auxtex settings

;; (load "auctex.el" nil t t)
;; (load "preview-latex.el" nil t t)
(defun my-LaTeX-mode-hook()
  (auto-fill-mode t)
  (outline-minor-mode t)
  (visual-line-mode t)
  (turn-on-reftex)
  (LaTeX-math-mode t)
  (setq LaTeX-math-menu-unicode t)
  (flyspell-mode t)
  ;; Nomenclatrue command
  ;; (add-to-list 'TeX-command-list '("Nomenclature" "makeindex %s.nlo -s nomencl.ist -o %s.nls" TeX-run-command nil t))
  (TeX-engine-set "xetex")
  ;; Use adobe to open the output pdf file
  ;; man `open' in mac osx for detailed usage help
  ;; (add-to-list 'TeX-view-program-list-builtin '("Adobe" "open -a '/Applications/Adobe Reader.app' '%o'"))
  ;; (add-to-list 'TeX-view-program-selection '(output-pdf "Adobe"))
  (setq TeX-save-query nil)
  (setq TeX-show-compilation nil)
  (setq TeX-PDF-mode t))

(add-hook 'LaTeX-mode-hook 'my-LaTeX-mode-hook)
(setq reftex-plug-into-AUCTeX t)
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)

(provide 'init-auctex)