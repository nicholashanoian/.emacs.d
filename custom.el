(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(TeX-auto-save t)
 '(TeX-clean-confirm nil)
 '(TeX-electric-math (quote ("\\(" . "\\)")))
 '(TeX-electric-sub-and-superscript t)
 '(TeX-parse-self t)
 '(TeX-source-correlate-method (quote synctex))
 '(TeX-source-correlate-mode t)
 '(TeX-view-program-list (quote (("pdf-tools" "TeX-pdf-tools-sync-view"))))
 '(TeX-view-program-selection (quote ((output-pdf "pdf-tools"))))
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   (vector "#212121" "#B71C1C" "#558b2f" "#FFA000" "#2196f3" "#4527A0" "#00796b" "#FAFAFA"))
 '(beacon-color "light goldenrod yellow")
 '(company-backends
   (quote
	(org-keyword-backend company-bbdb company-eclim company-semantic company-clang company-xcode company-cmake company-capf company-files
						 (company-dabbrev-code company-gtags company-etags company-keywords)
						 company-oddmuse company-dabbrev)))
 '(company-idle-delay 0.25)
 '(company-minimum-prefix-length 2)
 '(company-quickhelp-color-background "#4F4F4F")
 '(company-quickhelp-color-foreground "#DCDCCC")
 '(company-require-match nil)
 '(compilation-message-face (quote default))
 '(cua-global-mark-cursor-color "#2aa198")
 '(cua-normal-cursor-color "#657b83")
 '(cua-overwrite-cursor-color "#b58900")
 '(cua-read-only-cursor-color "#859900")
 '(custom-safe-themes
   (quote
	("190a9882bef28d7e944aa610aa68fe1ee34ecea6127239178c7ac848754992df" "7356632cebc6a11a87bc5fcffaa49bae528026a78637acd03cae57c091afd9b9" "ab04c00a7e48ad784b52f34aa6bfa1e80d0c3fcacc50e1189af3651013eb0d58" "7153b82e50b6f7452b4519097f880d968a6eaf6f6ef38cc45a144958e553fbc6" "a0feb1322de9e26a4d209d1cfa236deaf64662bb604fa513cca6a057ddf0ef64" "04dd0236a367865e591927a3810f178e8d33c372ad5bfef48b5ce90d4b476481" "a24c5b3c12d147da6cef80938dca1223b7c7f70f2f382b26308eba014dc4833a" "732b807b0543855541743429c9979ebfb363e27ec91e82f463c91e68c772f6e3" "57fe2bf84d81baecc6d89ed97bdb19936a3052fc2551ca178667fc45feef2381" "8db4b03b9ae654d4a57804286eb3e332725c84d7cdab38463cb6b97d5762ad26" "b85fc9f122202c71b9884c5aff428eb81b99d25d619ee6fde7f3016e08515f07" "b34636117b62837b3c0c149260dfebe12c5dad3d1177a758bb41c4b15259ed7e" "d8f76414f8f2dcb045a37eb155bfaa2e1d17b6573ed43fb1d18b936febc7bbc2" "a156fcac344bbfdc979a5adf9cecf1c2de56c4c937549ae0571b7f11ad4fe6a9" "ce3e6c12b48979ce89754884d913c7ecc8a7956543d8b09ef13abfab6af9aa35" "b01b91ba9276deb39aa892c105a8644ef281b4d1804ab7c48de96e9c5d2aaa48" "ecba61c2239fbef776a72b65295b88e5534e458dfe3e6d7d9f9cb353448a569e" "a566448baba25f48e1833d86807b77876a899fc0c3d33394094cf267c970749f" "8891c81848a6cf203c7ac816436ea1a859c34038c39e3cf9f48292d8b1c86528" "9d9fda57c476672acd8c6efeb9dc801abea906634575ad2c7688d055878e69d6" "a3fa4abaf08cc169b61dea8f6df1bbe4123ec1d2afeb01c17e11fdc31fc66379" "6b289bab28a7e511f9c54496be647dc60f5bd8f9917c9495978762b99d8c96a0" "eecacf3fb8efc90e6f7478f6143fd168342bbfa261654a754c7d47761cec07c8" "84d2f9eeb3f82d619ca4bfffe5f157282f4779732f48a5ac1484d94d5ff5b279" "b9e9ba5aeedcc5ba8be99f1cc9301f6679912910ff92fdf7980929c2fc83ab4d" "c74e83f8aa4c78a121b52146eadb792c9facc5b1f02c917e3dbb454fca931223" "a27c00821ccfd5a78b01e4f35dc056706dd9ede09a8b90c6955ae6a390eb1c1e" "3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" "fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" "4cf3221feff536e2b3385209e9b9dc4c2e0818a69a1cdb4b522756bcdf4e00a4" "4aee8551b53a43a883cb0b7f3255d6859d766b6c5e14bcb01bed572fcbef4328" "e3fc83cdb5f9db0d0df205f5da89af76feda8c56d79a653a5d092c82c7447e02" "4af6fad34321a1ce23d8ab3486c662de122e8c6c1de97baed3aa4c10fe55e060" "3b5ce826b9c9f455b7c4c8bff22c020779383a12f2f57bf2eb25139244bb7290" "2cfc1cab46c0f5bae8017d3603ea1197be4f4fff8b9750d026d19f0b9e606fae" "30f7c9e85d7fad93cf4b5a97c319f612754374f134f8202d1c74b0c58404b8df" "b9cbfb43711effa2e0a7fbc99d5e7522d8d8c1c151a3194a4b176ec17c9a8215" "291588d57d863d0394a0d207647d9f24d1a8083bb0c9e8808280b46996f3eb83" "628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" "bb08c73af94ee74453c90422485b29e5643b73b05e8de029a6909af6a3fb3f58" "1b8d67b43ff1723960eb5e0cba512a2c7a2ad544ddb2533a90101fd1852b426e" "82d2cac368ccdec2fcc7573f24c3f79654b78bf133096f9b40c20d97ec1d8016" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "bea5fd3610ed135e6ecc35bf8a9c27277d50336455dbdd2969809f7d7c1f7d79" "9a155066ec746201156bb39f7518c1828a73d67742e11271e4f24b7b178c4710" "43c1a8090ed19ab3c0b1490ce412f78f157d69a29828aa977dae941b994b4147" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" "e11569fd7e31321a33358ee4b232c2d3cf05caccd90f896e1df6cab228191109" default)))
 '(elpy-syntax-check-command "/bin/flake8")
 '(ensime-sem-high-faces
   (quote
	((var :foreground "#000000" :underline
		  (:style wave :color "yellow"))
	 (val :foreground "#000000")
	 (varField :foreground "#600e7a" :slant italic)
	 (valField :foreground "#600e7a" :slant italic)
	 (functionCall :foreground "#000000" :slant italic)
	 (implicitConversion :underline
						 (:color "#c0c0c0"))
	 (implicitParams :underline
					 (:color "#c0c0c0"))
	 (operator :foreground "#000080")
	 (param :foreground "#000000")
	 (class :foreground "#20999d")
	 (trait :foreground "#20999d" :slant italic)
	 (object :foreground "#5974ab" :slant italic)
	 (package :foreground "#000000")
	 (deprecated :strike-through "#000000"))))
 '(fci-rule-color "#eee8d5")
 '(flycheck-color-mode-line-face-to-color (quote mode-line-buffer-id))
 '(flycheck-global-modes (quote (not org-mode)))
 '(font-lock-maximum-decoration (quote ((dired-mode . 1) (t . t))))
 '(frame-background-mode (quote light))
 '(global-hl-line-mode t)
 '(global-visual-line-mode t)
 '(google-translate-output-destination (quote popup))
 '(haskell-process-args-stack-ghci
   (quote
	("--ghci-options=-ferror-spans -fshow-loaded-modules" "--no-build" "--no-load")))
 '(haskell-process-auto-import-loaded-modules t)
 '(haskell-process-log t)
 '(haskell-process-suggest-remove-import-lines t)
 '(haskell-process-type (quote stack-ghci))
 '(helm-ag-base-command "ack --nocolor --nogroup")
 '(helm-command-prefix-key "M-,")
 '(helm-display-header-line nil)
 '(helm-echo-input-in-header-line t)
 '(helm-ff-skip-boring-files t)
 '(helm-net-prefer-curl t)
 '(helm-split-window-default-side (quote below))
 '(helm-split-window-inside-p t)
 '(highlight-changes-colors (quote ("#d33682" "#6c71c4")))
 '(highlight-symbol-colors
   (--map
	(solarized-color-blend it "#fdf6e3" 0.25)
	(quote
	 ("#b58900" "#2aa198" "#dc322f" "#6c71c4" "#859900" "#cb4b16" "#268bd2"))))
 '(highlight-symbol-foreground-color "#586e75")
 '(highlight-tail-colors
   (quote
	(("#eee8d5" . 0)
	 ("#B4C342" . 20)
	 ("#69CABF" . 30)
	 ("#69B7F0" . 50)
	 ("#DEB542" . 60)
	 ("#F2804F" . 70)
	 ("#F771AC" . 85)
	 ("#eee8d5" . 100))))
 '(hl-bg-colors
   (quote
	("#DEB542" "#F2804F" "#FF6E64" "#F771AC" "#9EA0E5" "#69B7F0" "#69CABF" "#B4C342")))
 '(hl-fg-colors
   (quote
	("#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3")))
 '(hl-paren-colors (quote ("#2aa198" "#b58900" "#268bd2" "#6c71c4" "#859900")))
 '(hl-sexp-background-color "#efebe9")
 '(ispell-personal-dictionary "~/Dropbox/config/.aspell.en.pws")
 '(jdee-db-active-breakpoint-face-colors (cons "#191C25" "#80A0C2"))
 '(jdee-db-requested-breakpoint-face-colors (cons "#191C25" "#A2BF8A"))
 '(jdee-db-spec-breakpoint-face-colors (cons "#191C25" "#434C5E"))
 '(jdee-server-dir "~/myJars")
 '(line-spacing nil)
 '(magit-diff-use-overlays nil)
 '(neo-theme (quote classic))
 '(neo-window-width 30)
 '(nrepl-message-colors
   (quote
	("#dc322f" "#cb4b16" "#b58900" "#546E00" "#B4C342" "#00629D" "#2aa198" "#d33682" "#6c71c4")))
 '(org-agenda-files (quote ("~/Dropbox/org/agend.org")))
 '(org-file-apps
   (quote
	((auto-mode . emacs)
	 ("\\.mm\\'" . default)
	 ("\\.x?html?\\'" . default)
	 ("\\.pdf\\'" . "okular --unique %s#src:%n%b"))))
 '(org-highlight-latex-and-related (quote (latex entities)))
 '(package-selected-packages
   (quote
	(helm-hoogle helm-ag dired+ which-key intero haskell-mode haskell bash-completion powerline material-theme delight mdi zenburn-theme solarized-theme color-theme-sanityinc-tomorrow zenburn wordnut adaptive-wrap plantuml-mode plantuml texfrag auctex helm-flyspell hydra sublimity-attractive sublimity-map sublimity-scroll spacemacs-common spaceline pdf-tools expand-region hungry-delete undo-tree ov ox-latex org-edit-latex org-latex yasnippit java-snippets web-mode virtualenvwrapper all-the-fonts all-the-icons neotree exec-path-from-shell python-mode electric-operator anaconda-mode company-jedi helm-projectile projectile multiple-cursors js2-refactor js2-mode groovy-mode gradle-mode meghanada eclimd helm-org helm-files tex-site helm-swoop try ace-window auto-org-md org-edna org-bullets company-emacs-eclim eclim markdown-mode magit cdlatex avy-flycheck aggressive-indent company helm flycheck diminish use-package)))
 '(pdf-sync-forward-display-pdf-key "<C-return>" t)
 '(pdf-view-display-size (quote fit-page) nil nil "Show full pages by default instead of fitting page width.")
 '(pdf-view-image-relief 4)
 '(pdf-view-midnight-colors (quote ("#DCDCCC" . "#383838")))
 '(pos-tip-background-color "#eee8d5")
 '(pos-tip-foreground-color "#586e75")
 '(powerline-gui-use-vcs-glyph t)
 '(preview-document-pt-list
   (quote
	(5 preview-auctex-font-size preview-default-document-pt)))
 '(projectile-globally-ignored-file-suffixes (quote ("#" "~")))
 '(py-python-command "/usr/bin/python")
 '(py-shell-name "python3")
 '(reftex-plug-into-AUCTeX t t)
 '(safe-local-variable-values
   (quote
	((eval progn
		   (toggle-latex-export-on-save)
		   (flyspell-mode)))))
 '(smartrep-mode-line-active-bg (solarized-color-blend "#859900" "#657b83" 0.2))
 '(tab-width 4)
 '(term-default-bg-color "#fdf6e3")
 '(term-default-fg-color "#657b83")
 '(texfrag-header-default
   "\\documentclass{homework}
\\usepackage{amsmath,amsfonts}
\\usepackage[utf8]{inputenc}
\\usepackage[T1]{fontenc}
\\begin{document}")
 '(texfrag-subdir "build/texfrag")
 '(vc-annotate-background nil)
 '(vc-annotate-background-mode nil)
 '(vc-annotate-color-map
   (quote
	((20 . "#dc322f")
	 (40 . "#c8805d801780")
	 (60 . "#bec073400bc0")
	 (80 . "#b58900")
	 (100 . "#a5008e550000")
	 (120 . "#9d0091000000")
	 (140 . "#950093aa0000")
	 (160 . "#8d0096550000")
	 (180 . "#859900")
	 (200 . "#66aa9baa32aa")
	 (220 . "#57809d004c00")
	 (240 . "#48559e556555")
	 (260 . "#392a9faa7eaa")
	 (280 . "#2aa198")
	 (300 . "#28669833af33")
	 (320 . "#279993ccbacc")
	 (340 . "#26cc8f66c666")
	 (360 . "#268bd2"))))
 '(vc-annotate-very-old-color nil)
 '(weechat-color-list
   (quote
	(unspecified "#fdf6e3" "#eee8d5" "#990A1B" "#dc322f" "#546E00" "#859900" "#7B6000" "#b58900" "#00629D" "#268bd2" "#93115C" "#d33682" "#00736F" "#2aa198" "#657b83" "#839496")))
 '(which-key-mode t)
 '(xterm-color-names
   ["#eee8d5" "#dc322f" "#859900" "#b58900" "#268bd2" "#d33682" "#2aa198" "#073642"])
 '(xterm-color-names-bright
   ["#fdf6e3" "#cb4b16" "#93a1a1" "#839496" "#657b83" "#6c71c4" "#586e75" "#002b36"]))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(aw-leading-char-face ((t (:inherit ace-jump-face-foreground :height 3.0))))
 '(custom-variable-tag ((t (:foreground "#DFAF8F" :weight bold))))
 '(term ((t (:inherit nil))))
 '(term-default-bg-color ((t (:inherit term-color-black))))
 '(term-default-fg-color ((t (:inherit term-color-white)))))
