;;; init-ui.el --- user interface settings

;; Turn off menu/tool/scroll bar
;; (when (functionp 'menu-bar-mode)
;;   (menu-bar-mode -1))
(when (functionp 'set-scroll-bar-mode)
  (set-scroll-bar-mode 'nil))
(when (functionp 'mouse-wheel-mode)
  (mouse-wheel-mode -1))
(when (functionp 'tooltip-mode)
  (tooltip-mode -1))
(when (functionp 'tool-bar-mode)
  (tool-bar-mode -1))
(when (functionp 'blink-cursor-mode)
  (blink-cursor-mode -1))

;; supress gui startup message
(setq inhibit-startup-message t)
(setq inhibit-startup-echo-area-message t)

;; show date/time in mode line
(setq display-time-day-and-date t)
(display-time)

;; display row and column number
(column-number-mode t)
(line-number-mode t)

;; Make emacs frame transparent
(defun transparency (value)
  "Sets the transparency of the frame window."
  (interactive "nOpaque degree 0 - 100:")
  (set-frame-parameter (selected-frame) 'alpha value))


(require 'spacemacs-dark-theme)
(require 'spacemacs-light-theme)
(require 'spaceline-config)

;; (require 'color-theme)
(when window-system
  (transparency 100)
  ;; Set font size
  ;; Use 'C-x C-+'/'C-x C--' to adjust the font size
  (set-face-attribute 'default nil :height 150)
  (setq frame-title-format '(buffer-file-name "%f" ("%b")))
  (setq x-select-enable-clipboard t)
  ;; color theme
  ;; alternative choice `color-theme-solarized' or `zenburn'
  ;; (load-theme 'zenburn t)
  (load-theme 'spacemacs-light t)
  ;; toggle full screen
  (toggle-frame-maximized)
  ;; (toggle-frame-fullscreen)
  ;; mode line
  ;; (nyan-mode)
  (setq powerline-default-separator 'zigzag
        spaceline-minor-modes-separator " ")
  (spaceline-spacemacs-theme)
  (spaceline-helm-mode)
  (spaceline-toggle-minor-modes-off))

(beacon-mode 1)

;; highlight current line
(when (> (display-color-cells) 8)
  (global-hl-line-mode t)
  ;; (set-face-background 'hl-line "black")
  )

;; mechanical keyborad sound for fun
;; (selectric-mode -1)

(provide 'init-ui)
