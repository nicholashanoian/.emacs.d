;;; org-latex-classes.el --- Sample configuration file for LaTeX

;;; Commentary:

;;; Code:



;;; orgmk.el --- Emacs configuration file for `orgmk'

;;; Commentary:

;;; Code:

;; remember this directory
(defconst orgmk-el-directory
  (file-name-directory (or load-file-name (buffer-file-name)))
  "Directory path of Orgmk.")

;; ;; activate debugging
;; (setq debug-on-error t)
(setq org-latex-default-packages-alist '())
;; no limit when printing values
(setq eval-expression-print-length nil)
(setq eval-expression-print-level nil)

;; don't make a backup of files
(setq backup-inhibited t)

;; ;; let Emacs recognize Cygwin paths (e.g. /usr/local/lib)
;; (add-to-list 'load-path "~/Downloads/emacs/site-lisp") ;; <- adjust
;; (when (eq system-type 'windows-nt)
;;   (when (try-require 'cygwin-mount)
;;     (cygwin-mount-activate)))

;; shell
(message "Current value of `shell-file-name': %s" shell-file-name)
(unless (equal shell-file-name "bash")
  (setq shell-file-name "bash")
  (message "... changed to: %s" shell-file-name))

(when (locate-library "package")
  (require 'package)
  (add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
  (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
  (package-initialize)
  (unless package-archive-contents
    (package-refresh-contents)))

(unless (locate-library "ox")           ; trick to detect the presence of Org 8
  (ding)
  (message "The versions 6 and 7 of Org mode are no longer supported")
  (message "Time to upgrade, don't you think?")
  (when (locate-library "package")
    (let ((pkg 'org))
      (if (yes-or-no-p (format "Install package `%s'? " pkg))
          (ignore-errors
            (package-install pkg))
        (setq debug-on-error nil)
        (error "Please upgrade to 8 or later")))))

(when (locate-library "package")
  (unless (locate-library "htmlize")    ; for syntax highlighting in org2html
    (let ((pkg 'htmlize))
      (if (yes-or-no-p (format "Install package `%s'? " pkg))
          (ignore-errors
            (package-install pkg)))))
  (unless (locate-library "ox-gfm")     ; for exporting to GFM
    (let ((pkg 'ox-gfm))
      (if (yes-or-no-p (format "Install package `%s`? " pkg))
          (ignore-errors
            (package-install pkg))))))

;; version info
(let ((org-install-dir (file-name-directory (locate-library "org-loaddefs")))
      (org-dir (file-name-directory (locate-library "org")))) ; org.(el|elc)
  (message "Org mode version %s (org @ %s)"
           (org-version)
           (if (string= org-dir org-install-dir)
               org-install-dir
             (concat "mixed installation! " org-install-dir " and " org-dir))))

(require 'org)
(require 'org-clock)
(require 'ox)

(add-to-list 'auto-mode-alist '("\\.txt\\'" . org-mode))

;; make sure that timestamps appear in English
(setq system-time-locale "C")           ; [default: nil]

;; format string used when creating CLOCKSUM lines and when generating a
;; time duration (avoid showing days)
(setq org-time-clocksum-format
      '(:hours "%d" :require-hours t :minutes ":%02d" :require-minutes t))

;; format string for the total time cells
(setq org-clock-total-time-cell-format "%s")

;; format string for the file time cells
(setq org-clock-file-time-cell-format "%s")

;; hide the emphasis marker characters
(setq org-hide-emphasis-markers t)      ; impact on table alignment!

;; don't insert a time stamp into the exported file
(setq org-export-time-stamp-file nil)

;; activate smart quotes during export (convert " to \og, \fg in French)
(setq org-export-with-smart-quotes t)   ; curly quotes in HTML

;; interpret "_" and "^" for export when braces are used
(setq org-export-with-sub-superscripts '{})

;; allow #+BIND to define local variable values for export
(setq org-export-allow-bind-keywords t)

;; configure Babel to support most languages
(add-to-list 'org-babel-load-languages '(R . t)) ; Requires R and ess-mode.
(add-to-list 'org-babel-load-languages '(awk . t))
(add-to-list 'org-babel-load-languages '(ditaa . t)) ; Sudo aptitude install openjdk-6-jre.
(add-to-list 'org-babel-load-languages '(dot . t))
(add-to-list 'org-babel-load-languages '(java . t))
(add-to-list 'org-babel-load-languages '(latex . t)) ; Shouldn't you use #+begin/end_latex blocks instead?
(add-to-list 'org-babel-load-languages '(ledger . t)) ; Requires ledger.
(add-to-list 'org-babel-load-languages '(makefile . t))
(add-to-list 'org-babel-load-languages '(org . t))
(if (locate-library "ob-shell")         ; ob-sh renamed on 2013-12-13
    (add-to-list 'org-babel-load-languages '(shell . t))
  (add-to-list 'org-babel-load-languages '(sh . t)))
(add-to-list 'org-babel-load-languages '(sql . t))

(org-babel-do-load-languages            ; loads org, gnus-sum, etc...
 'org-babel-load-languages org-babel-load-languages)

;; accented characters on graphics
(setq org-babel-R-command
      (concat org-babel-R-command " --encoding=UTF-8"))

;; don't require confirmation before evaluating code blocks
(setq org-confirm-babel-evaluate nil)

;; load up Babel libraries
(let ((lob-file (concat (file-name-directory (locate-library "org"))
                        "../doc/library-of-babel.org")))
  (when (file-exists-p lob-file)
    (org-babel-lob-ingest lob-file)))

(when (require 'ox-html)

  ;; export the CSS selectors only, when formatting code snippets
  (setq org-html-htmlize-output-type 'css)

  ;; ;; XML encoding
  ;; (setq org-html-xml-declaration
  ;;       '(("html" . "<!-- <xml version=\"1.0\" encoding=\"%s\"> -->")))

  ;; coding system for HTML export
  (setq org-html-coding-system 'utf-8)

  ;; ;; format for the HTML postamble
  ;; (setq org-html-postamble
  ;;       "  <div id=\"footer\"><div id=\"copyright\">\n    Copyright &copy; %d %a\n  </div></div>")

  ;; don't include the JavaScript snippets in exported HTML files
  (setq org-html-head-include-scripts nil)

  ;; turn inclusion of the default CSS style off
  (setq org-html-head-include-default-style nil)

  (defun org-html-export-body-only-to-html ()
    "Export only code between between \"<body>\" and \"</body>\" tags to a HTML file."
    (interactive)
    (org-html-export-to-html nil nil nil t)))

;; (when (require 'ox-latex)

;;   ;; ;; This is disturbing when calling `org2html'.
;;   ;; (when (executable-find "latexmk")
;;   ;;   (message "%s" (shell-command-to-string "latexmk --version")))

;;   (setq org-latex-pdf-process
;;         (if (eq system-type 'cygwin) ;; running a Cygwin version of Emacs
;;             ;; use Latexmk (if installed with LaTeX)
;;             (if (executable-find "latexmk")
;;                 '("latexmk -CF -pdf $(cygpath -m %f) && latexmk -c")
;;               '("pdflatex -interaction=nonstopmode -output-directory=%o $(cygpath -m %f)"
;;                 "pdflatex -interaction=nonstopmode -output-directory=%o $(cygpath -m %f)"
;;                 "pdflatex -interaction=nonstopmode -output-directory=%o $(cygpath -m %f)"))
;;           (if (executable-find "latexmk")
;;               '("latexmk -CF -pdf %f && latexmk -c")
;;             '("pdflatex -interaction=nonstopmode -output-directory=%o %f"
;;               "pdflatex -interaction=nonstopmode -output-directory=%o %f"
;;               "pdflatex -interaction=nonstopmode -output-directory=%o %f"))))



;; tell org to use `listings' (instead of `verbatim') for source code
(setq org-latex-listings t)

;; default packages to be inserted in the header
;; include the `listings' package for fontified source code
(add-to-list 'org-latex-packages-alist '("" "listings") t)

;; include the `xcolor' package for colored source code
(add-to-list 'org-latex-packages-alist '("" "xcolor") t)

;; include the `babel' package for language-specific hyphenation and
;; typography
(add-to-list 'org-latex-packages-alist '("english" "babel") t)

;; default position for LaTeX figures
(setq org-latex-default-figure-position "!htbp")

(defun org-latex-export-body-only-to-latex ()
  "Export only code between \"\begin{document}\" and \"\end{document}\" to a LaTeX file."
  (interactive)
  (org-latex-export-to-latex nil nil nil t))

;; require all files from `lisp' directory
;; (dolist (file (directory-files
;; (concat orgmk-el-directory "../lisp/") t ".+\\.elc?$"))
;; (load-file file))

;; (message "LaTeX command: %S" org-latex-pdf-process)

;;; orgmk.el ends here








(require 'ox-latex)

(setq make-backup-files nil) ; stop creating backup~ files

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



;; (setq org-latex-pdf-process
;; '("latexmk -pdflatex='pdflatex -shell-escape -interaction nonstopmode' -logfilewarninglist -pdf -f %f > %f.log"))



;; (setq org-latex-pdf-process
;; '("latexmk -pdflatex='pdflatex -shell-escape -interaction nonstopmode' -logfilewarninglist -jobname='.build/%f' -pdf -f %f > %f.log"))





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

;; (require 'ov)

(unless (boundp 'org-latex-classes)
  (setq org-latex-classes nil))

(add-to-list 'org-latex-classes
			 '("homework"
			   "\\ProvidesPackage{/home/nick/cloud/config/homework}
                \\documentclass{/home/nick/cloud/config/homework}"
			   ("\\section{%s}" . "\\section*{%s}")
			   ("\\subsection{%s}" . "\\subsection*{%s}")
			   ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
			   ("\\paragraph{%s}" . "\\paragraph*{%s}")
			   ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))

(add-to-list 'org-latex-classes
             '("cheatsheet"
               "\\ProvidesPackage{/home/nick/cloud/config/cheatsheet}
                \\documentclass[landscape]{/home/nick/cloud/config/cheatsheet}"
               ("\\section{%s}" . "\\section*{%s}")
               ("\\subsection{%s}" . "\\subsection*{%s}")
               ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
               ("\\paragraph{%s}" . "\\paragraph*{%s}")
               ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))

(add-to-list 'org-latex-classes
			 '("nhh-turabian"
			   "\\ProvidesPackage{/home/nick/cloud/config/nhh-turabian}
                \\documentclass{/home/nick/cloud/config/nhh-turabian}"
			   ("\\section{%s}" . "\\section*{%s}")
			   ("\\subsection{%s}" . "\\subsection*{%s}")
			   ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
			   ("\\paragraph{%s}" . "\\paragraph*{%s}")
			   ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))

(add-to-list 'org-latex-classes
			 '("bagrow"
			   "\\ProvidesPackage{/home/nick/cloud/config/bagrow}
                \\documentclass{/home/nick/cloud/config/bagrow}"
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
