(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(TeX-auto-save t)
 '(TeX-clean-confirm nil)
 '(TeX-electric-math '("\\(" . "\\)"))
 '(TeX-electric-sub-and-superscript t)
 '(TeX-parse-self t)
 '(TeX-source-correlate-method 'synctex)
 '(TeX-source-correlate-mode t)
 '(TeX-view-program-list '(("pdf-tools" "TeX-pdf-tools-sync-view")))
 '(TeX-view-program-selection '((output-pdf "pdf-tools")))
 '(beacon-color "light goldenrod yellow")
 '(company-idle-delay 0.25)
 '(company-minimum-prefix-length 2)
 '(company-require-match nil)
 '(custom-enabled-themes '(leuven))
 '(custom-safe-themes
   '("84d2f9eeb3f82d619ca4bfffe5f157282f4779732f48a5ac1484d94d5ff5b279" "b9e9ba5aeedcc5ba8be99f1cc9301f6679912910ff92fdf7980929c2fc83ab4d" "c74e83f8aa4c78a121b52146eadb792c9facc5b1f02c917e3dbb454fca931223" "a27c00821ccfd5a78b01e4f35dc056706dd9ede09a8b90c6955ae6a390eb1c1e" "3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" "fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" "4cf3221feff536e2b3385209e9b9dc4c2e0818a69a1cdb4b522756bcdf4e00a4" "4aee8551b53a43a883cb0b7f3255d6859d766b6c5e14bcb01bed572fcbef4328" "e3fc83cdb5f9db0d0df205f5da89af76feda8c56d79a653a5d092c82c7447e02" "4af6fad34321a1ce23d8ab3486c662de122e8c6c1de97baed3aa4c10fe55e060" "3b5ce826b9c9f455b7c4c8bff22c020779383a12f2f57bf2eb25139244bb7290" "2cfc1cab46c0f5bae8017d3603ea1197be4f4fff8b9750d026d19f0b9e606fae" "30f7c9e85d7fad93cf4b5a97c319f612754374f134f8202d1c74b0c58404b8df" "b9cbfb43711effa2e0a7fbc99d5e7522d8d8c1c151a3194a4b176ec17c9a8215" "291588d57d863d0394a0d207647d9f24d1a8083bb0c9e8808280b46996f3eb83" "628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" "bb08c73af94ee74453c90422485b29e5643b73b05e8de029a6909af6a3fb3f58" "1b8d67b43ff1723960eb5e0cba512a2c7a2ad544ddb2533a90101fd1852b426e" "82d2cac368ccdec2fcc7573f24c3f79654b78bf133096f9b40c20d97ec1d8016" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "bea5fd3610ed135e6ecc35bf8a9c27277d50336455dbdd2969809f7d7c1f7d79" "9a155066ec746201156bb39f7518c1828a73d67742e11271e4f24b7b178c4710" "43c1a8090ed19ab3c0b1490ce412f78f157d69a29828aa977dae941b994b4147" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" "e11569fd7e31321a33358ee4b232c2d3cf05caccd90f896e1df6cab228191109" default))
 '(fci-rule-color "#d6d6d6")
 '(flycheck-color-mode-line-face-to-color 'mode-line-buffer-id)
 '(frame-background-mode 'light)
 '(global-hl-line-mode t)
 '(global-visual-line-mode t)
 '(helm-command-prefix-key "M-,")
 '(helm-display-header-line nil)
 '(helm-echo-input-in-header-line t)
 '(helm-ff-skip-boring-files t)
 '(helm-net-prefer-curl t)
 '(helm-split-window-default-side 'below)
 '(helm-split-window-inside-p t)
 '(ispell-personal-dictionary "~/Dropbox/config/.aspell.en.pws")
 '(jdee-server-dir "~/myJars")
 '(line-spacing nil)
 '(neo-theme 'classic)
 '(neo-window-width 30)
 '(org-file-apps
   '((auto-mode . emacs)
	 ("\\.mm\\'" . default)
	 ("\\.x?html?\\'" . default)
	 ("\\.pdf\\'" . "okular --unique %s#src:%n%b")))
 '(org-highlight-latex-and-related '(latex entities))
 '(package-selected-packages
   '(sublimity-attractive sublimity-map sublimity-scroll spacemacs-common spaceline pdf-tools texfrag expand-region hungry-delete undo-tree ov solarized-theme ox-latex org-edit-latex org-latex yasnippit java-snippets web-mode virtualenvwrapper all-the-fonts all-the-icons neotree exec-path-from-shell python-mode electric-operator anaconda-mode company-jedi helm-projectile projectile multiple-cursors js2-refactor js2-mode groovy-mode gradle-mode meghanada eclimd helm-org helm-files tex-site helm-swoop color-theme-sanityinc-tomorrow try ace-window auto-org-md org-edna org-bullets company-emacs-eclim eclim markdown-mode magit cdlatex avy-flycheck aggressive-indent auctex company helm flycheck diminish use-package))
 '(pdf-sync-forward-display-pdf-key "<C-return>" t)
 '(pdf-view-display-size 'fit-page nil nil "Show full pages by default instead of fitting page width.")
 '(pdf-view-image-relief 4)
 '(powerline-gui-use-vcs-glyph t)
 '(preview-document-pt-list '(5 preview-auctex-font-size preview-default-document-pt))
 '(projectile-globally-ignored-file-suffixes '("#" "~"))
 '(py-python-command "/usr/bin/python")
 '(py-shell-name "python3")
 '(reftex-plug-into-AUCTeX t t)
 '(sml/mode-width (if (eq (powerline-current-separator) 'arrow) 'right 'full))
 '(sml/pos-id-separator
   '(""
	 (:propertize " " face powerline-active1)
	 (:eval
	  (propertize " " 'display
				  (funcall
				   (intern
					(format "powerline-%s-%s"
							(powerline-current-separator)
							(car powerline-default-separator-dir)))
				   'powerline-active1 'powerline-active2)))
	 (:propertize " " face powerline-active2)))
 '(sml/pos-minor-modes-separator
   '(""
	 (:propertize " " face powerline-active1)
	 (:eval
	  (propertize " " 'display
				  (funcall
				   (intern
					(format "powerline-%s-%s"
							(powerline-current-separator)
							(cdr powerline-default-separator-dir)))
				   'powerline-active1 'sml/global)))
	 (:propertize " " face sml/global)))
 '(sml/pre-id-separator
   '(""
	 (:propertize " " face sml/global)
	 (:eval
	  (propertize " " 'display
				  (funcall
				   (intern
					(format "powerline-%s-%s"
							(powerline-current-separator)
							(car powerline-default-separator-dir)))
				   'sml/global 'powerline-active1)))
	 (:propertize " " face powerline-active1)))
 '(sml/pre-minor-modes-separator
   '(""
	 (:propertize " " face powerline-active2)
	 (:eval
	  (propertize " " 'display
				  (funcall
				   (intern
					(format "powerline-%s-%s"
							(powerline-current-separator)
							(cdr powerline-default-separator-dir)))
				   'powerline-active2 'powerline-active1)))
	 (:propertize " " face powerline-active1)))
 '(sml/pre-modes-separator (propertize " " 'face 'sml/modes))
 '(spaceline-all-the-icons-clock-always-visible nil)
 '(spaceline-all-the-icons-slim-render t)
 '(spaceline-all-the-icons-window-number-always-visible nil)
 '(tab-width 4)
 '(texfrag-header-default
   "\\documentclass{homework}\n\\usepackage{amsmath,amsfonts}\n\\usepackage[utf8]{inputenc}\n\\usepackage[T1]{fontenc}\n\\begin{document}")
 '(texfrag-subdir "build/texfrag")
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   '((20 . "#c82829")
	 (40 . "#f5871f")
	 (60 . "#eab700")
	 (80 . "#718c00")
	 (100 . "#3e999f")
	 (120 . "#4271ae")
	 (140 . "#8959a8")
	 (160 . "#c82829")
	 (180 . "#f5871f")
	 (200 . "#eab700")
	 (220 . "#718c00")
	 (240 . "#3e999f")
	 (260 . "#4271ae")
	 (280 . "#8959a8")
	 (300 . "#c82829")
	 (320 . "#f5871f")
	 (340 . "#eab700")
	 (360 . "#718c00")))
 '(vc-annotate-very-old-color nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(aw-leading-char-face ((t (:inherit ace-jump-face-foreground :height 3.0))))
 '(hl-line ((t (:background "gray97"))))
 '(mode-line-inactive ((t (:box nil :underline "#5d4d7a" :overline "#5d4d7a"))))
 '(winum-face ((t (:foreground "yellow")))))
