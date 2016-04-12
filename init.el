;;; init.el

;;; Code:

(add-to-list 'load-path "~/.emacs.d/etc")

;; Load default "packages"
(ido-mode t)

;; Load local "packages"
(require 'unannoy)
(require 'org-setup)

;; elpa
(require 'package)
(package-initialize) ;; add all installed packages to the load path
(add-to-list 'package-archives
             '("melpa-stable" .
	       "http://stable.melpa.org/packages/") t)

;; Magit
(global-set-key (kbd "C-x g") 'magit-status)

;; Compile configuration
(byte-recompile-directory "~/.emacs.d/etc/" 0)
(byte-recompile-file "~/.emacs.d/init.el" nil 0)

;; ido-mode
(setq ido-enable-flex-matching t)
;; This tab override shouldn't be necessary given ido's default
;; configuration, but minibuffer-complete otherwise dominates the
;; tab binding because of my custom tab-completion-everywhere
;; configuration.
(add-hook 'ido-setup-hook
          (lambda ()
            (define-key ido-completion-map [tab] 'ido-complete)))

;; linum-relative
(require 'linum-relative)
(global-linum-mode t)

;; elpy
(elpy-enable)
(set-face-background 'highlight-indentation-face "#00736F")
(set-face-background 'highlight-indentation-current-column-face "#0073BF")

;; trailing spaces
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; Add OS specific code
(cond
 ;; Mac OS X
 ((eq system-type 'darwin)
    (progn
      (message "Loading darwin specific configurations")
      (require 'macosx)))
 ;; GNU/Linux
 ((eq system-type 'gnu/linux)
    (progn
      (message "Loading gnu/linux specific configurations")))
)

(provide 'init) ; make (require 'init) happy
