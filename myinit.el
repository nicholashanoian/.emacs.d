;;; package --- summary
;;; Commentary:
;;; Code:

;;disable start screen
(setq inhibit-startup-screen t)

;;yes or no prompts to y or n
(fset 'yes-or-no-p 'y-or-n-p)

(global-set-key (kbd "<f5>") 'revert-buffer)

;;reduce clutter in init file
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)
(package-initialize)

;; Delete my files by moving them to the trash. I'm human and
;; occasionally delete things that I actually want later:
(setq delete-by-moving-to-trash t)

;; Emacs has some awful scrolling by default. This gets rid of that.
(setq scroll-step 1) ; keyboard scroll one line at a time
(setq scroll-preserve-screen-position 'always)
(setq scroll-conservatively 101)
(setq next-screen-context-lines 5)

;;mouse scrolling

;; scroll one line at a time (less "jumpy" than defaults)
(setq mouse-wheel-scroll-amount '(3 ((shift) . 1))) ;; one line at a time
(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
(setq ring-bell-function 'ignore)

(message "hello from init.el")
(message "hello from ubuntu")

(global-visual-line-mode t)
(set-face-attribute 'default nil :height 110)

;;linum-mode hooks
(add-hook 'emacs-lisp-mode-hook 'linum-mode)
(add-hook 'sh-mode-hook 'linum-mode)

(use-package color-theme-sanityinc-tomorrow
  :ensure t)

(eval-when-compile
  (add-to-list 'load-path "~/.emacs.d/elpa/use-package" user-emacs-directory)
  (require 'use-package))
(require 'diminish)
(require 'bind-key)

(use-package ace-window
  :ensure t
  :init
  (setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l))
  (setq aw-background nil)
  (progn
    (global-set-key [remap other-window] 'ace-window)
    (custom-set-faces
     '(aw-leading-char-face
       ((t (:inherit ace-jump-face-foreground :height 3.0)))))
    ))

(use-package aggressive-indent
  ;; Keep code indented automatically
  :defer 10
  :config
  (global-aggressive-indent-mode))

(use-package cdlatex
  :hook (LaTeX-mode . turn-on-cdlatex))

(use-package tex-site
  ;; AuCTeX is better than the built in tex mode; let's use it.  This
  ;; demand adds almost nothing and ensures that auctex gets to set itself
  ;; up properly. That's necessary because of how weirdly it gets loaded.
  :demand t
  :custom
  (TeX-auto-save t)
  (TeX-electric-escape t)
  (TeX-electric-math '("\\(" . "\\)") "Smart $ behavior")
  (TeX-electric-sub-and-superscript t)
  (TeX-parse-self t)
  (reftex-plug-into-AUCTeX t)
  (TeX-source-correlate-method 'synctex)
  (TeX-source-correlate-mode t)
  (TeX-clean-confirm nil)
  ;; TeX-command-list by default contains a bunch of stuff I'll never
  ;; use. I use latexmk, xelatexmk, and View.  That's pretty much it.
  ;; Maybe one day I'll add "clean" back to the list.
  ;; (TeX-command-list
  ;;  '(("latexmk" "latexmk -synctex=1 -quiet -pdf %s"
  ;;     TeX-run-compile nil t :help "Process file with latexmk")
  ;;    ("View" "%V" TeX-run-discard-or-function nil t :help "Run Viewer")
  ;;    ("xelatexmk" "latexmk -synctex=1 -quiet -xelatex %s"
  ;;     TeX-run-compile nil t :help "Process file with xelatexmk")))
  :hook
  (LaTeX-mode . LaTeX-math-mode)
  (LaTeX-mode . reftex-mode)
  (LaTeX-mode . TeX-PDF-mode)
  (LaTeX-mode . (lambda ()
		  (push
		   '("Make" "latexmk -outdir=/tmp %t" TeX-run-TeX nil t
		     :help "Make pdf output using latexmk.")
		   TeX-command-list)))
  :config
  (setq-default TeX-command-default "latexmk")
  ;; revert pdf from file after compilation finishes
  (use-package tex-buf
    :config
    (add-hook 'TeX-after-compilation-finished-functions #'TeX-revert-document-buffer))
  (use-package latex
    :bind
    (:map LaTeX-mode-map
          ("M-p" . outline-previous-visible-heading)
          ("M-n" . outline-next-visible-heading)
          ("<backtab>" . org-cycle))
    :config
    (push "\\.fdb_latexmk" LaTeX-clean-intermediate-suffixes)
    (push "\\.fls" LaTeX-clean-intermediate-suffixes)
    (push "\\.synctex.gz" LaTeX-clean-intermediate-suffixes)))

(use-package company
  ;; Company mode provides autocompletion of text and code.
  :bind
  (:map company-active-map
	("C-s" . company-search-candidates)
	("<tab>" . company-complete-common-or-cycle)
	("RET" . company-complete-selection)
	("C-n" . company-select-next)
	("C-p" . company-select-previous))
  :hook
  ((prog-mode ess-mode) . company-mode)
  :custom
  (company-idle-delay 0.25)
  (company-require-match nil)
  (company-minimum-prefix-length 2))

;; (use-package eclim
;;   :init (setq help-at-pt-display-when-idle t
;;               help-at-pt-timer-delay       0.1
;;               eclimd-executable            "/opt/eclipse/eclimd"
;;               eclim-executable             "/opt/eclipse/plugins/org.eclim_2.7.2/bin/eclim"
;;               ;;eclimd-default-workspace     "~/Documents/workspace/"
;;               eclim-eclipse-dirs           '("/opt/eclipse"))

;;   :config (progn (help-at-pt-set-timer)
;;                  (mapc #'require '(eclimd company-emacs-eclim))
;;                  (company-emacs-eclim-setup)

;;                  (defun ers/eclim-run-class ()
;;                    (interactive)
;;                    (beginning-of-buffer)
;;                    (search "class ")
;;                    (forward-word)
;;                    (eclim-run-class))

;;                  (bind-keys :map eclim-mode-map
;;                             ("C-c C-e l m" . eclim-manage-projects)
;;                             ("C-c C-e l r" . ers/eclim-run-class)
;;                             ("C-c C-e l c" . garbage-collect)
;;                             ("C-c C-e l o" . eclim-problems-open)
;;                             ("C-c C-e l b" . eclim-project-build))

;;                  (dolist (elt '(groovy-mode-hook java-mode-hook))
;;                    (add-hook elt (lambda ()
;;                                    (interactive)
;;                                    (eclim-mode t))))))

(add-hook 'java-mode-hook
          (lambda ()
	    (require 'eclim)
	    (global-eclim-mode)
	    ;;(require 'eclimd)
	    (custom-set-variables
	     '(eclim-eclipse-dirs '("/opt/eclipse"))
	     '(eclim-executable "/opt/eclipse/plugins/org.eclim_2.7.2/bin/eclim"))
	    (setq help-at-pt-display-when-idle t)
	    (setq help-at-pt-timer-delay 0.1)
	    (help-at-pt-set-timer)
	    ;;regular auto-complete initialization
	    ;;(require 'auto-complete-config)
	    ;;ac-config-default)

	     ;;add the emacs-eclim source
	     ;;(require 'ac-emacs-eclim-source)
	     ;;(ac-emacs-eclim-config)

	     ;;(global-set-key (kbd "C-9") 'eclim-project-build)
	     ;;(global-set-key (kbd "C-6") 'eclim-java-find-declaration)
	     ))

(use-package flycheck
  :ensure t
  :init (global-flycheck-mode)
  :config 
  ;;(setq-default flycheck-disabled-checkers '(emacs-lisp-checkdoc))
  )

;;; Helm
(use-package helm
  ;; A package in a league of its own: https://tuhdo.github.io/helm-intro.html
  ;; load it soon after starting Emacs:
  :defer 1
  :bind
  (("M-x" . helm-M-x)
   ("C-x C-f" . helm-find-files)
   ("M-y" . helm-show-kill-ring)
   ("C-M-z" . helm-resume)
   ([remap occur] . helm-occur)
   ([remap bookmark-jump] . helm-bookmarks)
   ("C-x b" . helm-buffers-list)
   ("C-x C-b" . helm-buffers-list)
   ("M-s M-g" . helm-google-suggest)
   ("M-o" . helm-semantic-or-imenu)
   ("C-h SPC" . helm-all-mark-rings)
   ("M-s g" . helm-grep-do-git-grep)
   :map helm-map
   ("<tab>" . helm-execute-persistent-action)
   ("C-i" . helm-execute-persistent-action)
   ("C-z" . helm-select-action))
  :custom
  (helm-display-header-line nil)
  (helm-echo-input-in-header-line t)
  (helm-net-prefer-curl t)
  (helm-split-window-default-side 'below)
  (helm-split-window-inside-p t)
  (helm-command-prefix-key "M-,")
  :init
  (require 'helm-config)
  :config
  (use-package helm-files
    :config
    (push ".git$" helm-boring-file-regexp-list))
  (use-package helm-org
    :bind
    (:map my/map
	  ("t" . helm-org-agenda-files-headings)))
  (helm-mode)
  (use-package helm-swoop
    :config
    (progn
      (global-set-key (kbd "C-s") 'helm-swoop)
      )
  ))

(use-package magit
  ;;magit is magical git
  :bind ("C-x g" . magit-status))

(use-package markdown-mode
  :ensure t
  :commands (markdown-mode gfm-mode)
  :hook (markdown-mode . linum-mode)
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "pandoc"))

(use-package org-bullets
  :hook (org-mode . (lambda () (org-bullets-mode 1))))

(use-package pdf-tools
  ;; I like emacs, so why not view PDFs in it?  The built-in docview mode
  ;; can do so, but pdf-tools is better in all sorts of ways.

  ;; NOTE: ~pdf-tools~ only officially supports gnu/linux operating
  ;; systems. I think that it will work on macs as well, but you may have
  ;; to finagle it a bit. Regardless, I tell emacs to only use it if the OS
  ;; is linux based.
  :if (eq system-type 'gnu/linux)
  :magic ("%PDF" . pdf-view-mode)
  :defer 7
  :custom
  (pdf-sync-forward-display-pdf-key "<C-return>" "Use C-RET in latex mode to jump to location in pdf file")
  (pdf-view-display-size 'fit-page "Show full pages by default instead of fitting page width.")
  (TeX-view-program-selection '((output-pdf "pdf-tools")) "Use pdf-tools to display pdfs from latex runs.")
  (TeX-view-program-list '(("pdf-tools" "TeX-pdf-tools-sync-view")))
  :config
  ;; The t says to install the server without asking me --- this may take a
  ;; second
  (pdf-tools-install t))

(cd (getenv "OneDriveBash"))
