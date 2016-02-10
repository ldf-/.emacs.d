;;; unannoy.el --- disable Emacs' annoying bits

;;; Code:

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
