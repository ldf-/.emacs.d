;;; unannoy.el --- disable Emacs' annoying bits

;;; Code:

;; User org-mode for .org file
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))

;; Global org-mode keybindings
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-cb" 'org-iswitchb)

;; Remove linum mode on org-mode
(defun nolinum ()
  (interactive)
  (message "Deactivated linum mode")
  (global-linum-mode 0)
  (linum-mode 0)
)

(global-set-key (kbd "<f6>") 'nolinum)

(add-hook 'org-mode-hook 'nolinum)

;; bibtex support while exporting org to LaTeX
;; e.g. C-c C-e l o (main.org)
;;      %f = main.tex
;;      %b = main
;;  Output = main.pdf main.tex
(defvar org-latex-pdf-process)
(setq org-latex-pdf-process
      ;; (quote ("texi2dvi --pdf --clean --verbose --batch %f"
      ;; 	      "bibtex %b"
      ;; 	      "texi2dvi --pdf --clean --verbose --batch %f"
      ;; 	      "texi2dvi --pdf --clean --verbose --batch %f"
      ;;              )
      ;; 	     )
      (quote ("pdflatex -interaction=nonstopmode %f"
      	      "bibtex %b"
	      "pdflatex -interaction=nonstopmode %f"
	      "pdflatex -interaction=nonstopmode %f"
	      )
      	     )
      )

(require 'ox-latex)
(add-to-list 'org-latex-classes
         '("toptesi"
           "\\documentclass[pdfa, cucitura, twoside, 12pt, utf8, english]{toptesi}"
	   ("\\chapter{%s}" . "\\chapter*{%s}")
	   ("\\section{%s}" . "\\section*{%s}")
	   ("\\subsection{%s}" . "\\subsection*{%s}")
	   ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
	   ("\\paragraph{%s}" . "\\paragraph*{%s}")
	   ("\\subparagraph{%s}" . "\\subparagraph*{%s}")
	   )
         )

;; No linum-mode for org-mode

(provide 'org-setup)

;; Preserve indentation

org-src-preserve-indentation

;; Reference:
;; http://tex.stackexchange.com/questions/114864/how-to-get-bibtex-to-work-with-org-mode-latex-export
;; http://stackoverflow.com/questions/12432093/get-rid-of-reference-to-free-variable-byte-compilation-warnings/12434028#12434028
