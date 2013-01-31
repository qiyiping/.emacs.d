;;; init-ui.el --- user interface settings

;; Turn off menu/tool/scroll bar
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(when window-system
  (setq frame-title-format '(buffer-file-name "%f" ("%b")))
  (tooltip-mode -1)
  (mouse-wheel-mode t)
  (blink-cursor-mode -1)
  (setq x-select-enable-clipboard t))

;; supress gui startup message
(setq inhibit-startup-message t)
(setq inhibit-startup-echo-area-message t)

;; show date/time in mode line
(setq display-time-day-and-date t)
(display-time)

(column-number-mode t)
(line-number-mode t)

;; Set background/foreground mannually
;; Use `list-color-display' to show available colors
;; For console:
;; `TERM' environment variable should be set to xterm-256color
;; alias e="emacs -bg color-253 -fg color-236 -cr color-27"
;; For window system:
(when window-system
  (set-background-color "grey31")
  (set-foreground-color "grey91")
  (set-cursor-color "steelblue"))

;; Highlight current line
(when (> (display-color-cells) 8)
  (global-hl-line-mode t)
  (if window-system
      (set-face-background 'hl-line "DarkOliveGreen")))

;; Make emacs frame transparent
(defun transparency (value)
  "Sets the transparency of the frame window."
  (interactive "nOpaque degree 0 - 100:")
  (set-frame-parameter (selected-frame) 'alpha value))

(when window-system
  (transparency 93)
  ;; Set font size
  ;; Use 'C-x C-+'/'C-x C--' to adjust the font size
  (set-face-attribute 'default nil :height 140))

(provide 'init-ui)
