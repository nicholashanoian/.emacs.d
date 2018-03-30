;;; init.el --- Emacs initialization

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.

;;; Commentary:
;; Emacs config


;

;;; Code:

(package-initialize)

(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

(message "hello from init.el")
(message "hello from ubuntu")


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

;;disable start screen
(setq inhibit-startup-screen t)






;;modes
(global-linum-mode t)
(global-visual-line-mode t)
(set-face-attribute 'default nil :height 110)

;;set up use-package according to http://cachestocaches.com/2015/8/getting-started-use-package/
(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
;;(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (add-to-list 'load-path "~/.emacs.d/elpa/use-package" user-emacs-directory)
  (require 'use-package))
(require 'diminish)
(require 'bind-key)


;;packages

(use-package aggressive-indent
  ;; Keep code indented automatically
  :defer 10
  :config
  (global-aggressive-indent-mode))

(use-package cdlatex
  :hook (LaTeX-mode . turn-on-cdlatex))


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

(use-package flycheck
  :ensure t
  :init (global-flycheck-mode)
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
  (helm-mode))



(use-package magit
  ;;magit is magical git
  :bind ("C-x g" . magit-status))

(use-package markdown-mode
  :ensure t
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "multimarkdown"))


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
  (TeX-command-list
   '(("latexmk" "latexmk -synctex=1 -quiet -pdf %s"
      TeX-run-compile nil t :help "Process file with latexmk")
     ("View" "%V" TeX-run-discard-or-function nil t :help "Run Viewer")
     ("xelatexmk" "latexmk -synctex=1 -quiet -xelatex %s"
      TeX-run-compile nil t :help "Process file with xelatexmk")))
  :hook
  (LaTeX-mode . LaTeX-math-mode)
  (LaTeX-mode . reftex-mode)
  (LaTeX-mode . TeX-PDF-mode)
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

(cd (getenv "OneDriveBash"))

;;; init.el ends here
