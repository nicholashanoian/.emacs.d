;;; org-latex-classes.el --- Sample configuration file for LaTeX

;;; Commentary:

;;; Code:

(require 'ox-latex)

;; My custom LaTeX class for Org-mode export. require is needed for it to work.
(setf org-highlight-latex-and-related '(latex))
(setq org-src-fontify-natively t)
(setq org-latex-with-hyperref nil)
(setq org-latex-title-command "\\maketitle")
(setq org-latex-toc-command "")
(setq org-export-with-section-numbers nil)
(setq user-full-name "Nicholas Hanoian")
(setq org-latex-create-formula-image-program 'imagemagick)
(setq org-format-latex-options (plist-put org-format-latex-options :scale 2.0))
(setq org-latex-default-class "homework")
(setq preview-button-1 '[mouse-1])
(setq font-latex-fontify-script nil)
(setq font-latex-fontify-sectioning 'color)

(setq TeX-auto-untabify 't)
(setq org-latex-listings 'minted)
(setq org-latex-minted-options '(
								 ;; ("frame" "lines")
								 ;; ("framesep" "2mm")
								 ;; ("bgcolor" "bg")
								 ;; ("fontsize" "\\footnotesize")
								 ;; ("linenos" "")
								 ))

(setq org-src-fontify-natively t)



(setq org-latex-pdf-process
	  '("latexmk -pdflatex='pdflatex -shell-escape -interaction nonstopmode' -logfilewarninglist -pdf -f %f > %f.log"))

(defun tmp-pdf ()
  "Create a temporary file name to store pdf figures."
  (org-babel-temp-file "./figure-" ".pdf"))

(setq org-latex-image-default-width "0.75\\textwidth")
(setq org-latex-tables-booktabs t)



;; (setq org-latex-pdf-process
;;       '("latexmk -pdf -f %f"))


;; ;
										; (defvar texfrag-submap
;;  '(let ((map (make-sparse-keymap)))
;;   (define-key map "\C-p" #'preview-at-point)
;;   (define-key map "\C-r" #'preview-region)
;;   (define-key map "\C-b" #'preview-buffer)
;;   (define-key map "\C-d" #'preview-document)
;;   (define-key map "\C-f" #'preview-cache-preamble)
;;   (define-key map "\C-c\C-f" #'preview-cache-preamble-off)
;;   (define-key map "\C-i" #'preview-goto-info-page)
;;   ;;  (define-key map "\C-q" #'preview-paragraph)
;;   (define-key map "\C-e" #'preview-environment)
;;   (define-key map "\C-s" #'preview-section)
;;   (define-key map "\C-w" #'preview-copy-region-as-mml)
;;   (define-key map "\C-c\C-p" #'preview-clearout-at-point)
;;   (define-key map "\C-c\C-r" #'preview-clearout)
;;   (define-key map "\C-c\C-s" #'preview-clearout-section)
;;   (define-key map "\C-c\C-b" #'preview-clearout-buffer)
;;   (define-key map "\C-c\C-d" #'preview-clearout-document)
;;   map))

;;   (texfrag-set-prefix "\C-c\C-p")

(require 'ov)

(unless (boundp 'org-latex-classes)
  (setq org-latex-classes nil))

(add-to-list 'org-latex-classes
			 '("homework"
			   "\\ProvidesPackage{/home/nick/Dropbox/config/homework}
                \\documentclass{/home/nick/Dropbox/config/homework}"
			   ("\\section{%s}" . "\\section*{%s}")
			   ("\\subsection{%s}" . "\\subsection*{%s}")
			   ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
			   ("\\paragraph{%s}" . "\\paragraph*{%s}")
			   ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))

(add-to-list 'org-latex-classes
			 '("article"
			   "\\documentclass{article}"
			   ("\\section{%s}" . "\\section*{%s}")
			   ("\\subsection{%s}" . "\\subsection*{%s}")
			   ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
			   ("\\paragraph{%s}" . "\\paragraph*{%s}")
			   ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))

(setq org-export-headline-levels 4)

(setq org-babel-default-header-args
	  '((:session)
		(:exports . "both")
		(:tangle . "yes")
		(:results . "output")))


;;; org-latex-classes.el ends here
