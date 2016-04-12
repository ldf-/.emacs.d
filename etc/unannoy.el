;;; unannoy.el --- disable Emacs' annoying bits

;;; Code:

;; GUIs are for newbs
(menu-bar-mode -1)
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;; Too distracting
(blink-cursor-mode -1)

;; Don't jerk me around
(electric-indent-mode -1)

;; I never want to use this
(when (fboundp 'set-horizontal-scroll-bar-mode)
  (set-horizontal-scroll-bar-mode nil))

;; I hate typing
(defalias 'yes-or-no-p 'y-or-n-p)

;; Always use the one true encoding
(prefer-coding-system 'utf-8-unix)

;; Magit is the only front-end I care about
(setf vc-handled-backends nil
      vc-follow-symlinks t)

;; Stop scrolling by huge leaps
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))
      scroll-step 1
      scroll-preserve-screen-position t)
(global-set-key (kbd "M-n") (kbd "C-u 1 C-v"))
(global-set-key (kbd "M-p") (kbd "C-u 1 M-v"))

;; Full screen
(toggle-frame-fullscreen)

;; window moving
(windmove-default-keybindings)
;; (setq org-replace-disputed-keys t) ;; org-mode fix

;; auto-fill mode
(add-hook 'text-mode-hook 'turn-on-auto-fill)

(provide 'unannoy)

;;; unannoy.el ends here
