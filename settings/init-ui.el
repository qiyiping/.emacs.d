;;; init-ui.el --- user interface settings

;; Turn off menu/tool/scroll bar
;; (menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; supress gui startup message
(setq inhibit-startup-message t)
(setq inhibit-startup-echo-area-message t)

;; show date/time in mode line
(setq display-time-day-and-date t)
(display-time)

;; display row and column number
(column-number-mode t)
(line-number-mode t)

;; highlight current line
(when (> (display-color-cells) 8)
  (global-hl-line-mode t))

;; Make emacs frame transparent
(defun transparency (value)
  "Sets the transparency of the frame window."
  (interactive "nOpaque degree 0 - 100:")
  (set-frame-parameter (selected-frame) 'alpha value))

(require 'color-theme)

(when window-system
  (transparency 100)
  ;; Set font size
  ;; Use 'C-x C-+'/'C-x C--' to adjust the font size
  (set-face-attribute 'default nil :height 140)
  (setq frame-title-format '(buffer-file-name "%f" ("%b")))
  (tooltip-mode -1)
  (mouse-wheel-mode t)
  (blink-cursor-mode -1)
  (setq x-select-enable-clipboard t)
  ;; color theme
  ;; alternative choice `color-theme-solarized'
  (load-theme 'zenburn t)
  ;; toggle full screen
  (toggle-frame-maximized)
  ;; (toggle-frame-fullscreen)
  ;; mode line
  ;; (nyan-mode)
  (powerline-default-theme))

(beacon-mode 1)
(provide 'init-ui)
