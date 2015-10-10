;;; init.el

;;; Code:

(add-to-list 'load-path "~/.emacs.d/etc")

;; Load local "packages"
(require 'unannoy)

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

(provide 'init) ; make (require 'init) happy
