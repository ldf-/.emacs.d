;;; unannoy.el --- disable Emacs' annoying bits

;;; Code:

;; bibtex support while exporting org to LaTeX
;; e.g. C-c C-e l o (main.org)
;;      %f = main.tex
;;      %b = main
;;  Output = main.pdf main.tex
(defvar org-latex-pdf-process)
(setq org-latex-pdf-process 
      (quote ("texi2dvi --pdf --clean --verbose --batch %f"
	      "bibtex %b" 
	      "texi2dvi --pdf --clean --verbose --batch %f"
	      "texi2dvi --pdf --clean --verbose --batch %f")
	     )
      )

;; Reference:
;; http://tex.stackexchange.com/questions/114864/how-to-get-bibtex-to-work-with-org-mode-latex-export
;; http://stackoverflow.com/questions/12432093/get-rid-of-reference-to-free-variable-byte-compilation-warnings/12434028#12434028
