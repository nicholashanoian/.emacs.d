(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(TeX-auto-save t)
 '(TeX-clean-confirm nil)
 '(TeX-electric-escape t)
 '(TeX-electric-math (quote ("\\(" . "\\)")))
 '(TeX-electric-sub-and-superscript t)
 '(TeX-parse-self t)
 '(TeX-source-correlate-method (quote synctex))
 '(TeX-source-correlate-mode t)
 '(TeX-view-program-list (quote (("pdf-tools" "TeX-pdf-tools-sync-view"))))
 '(TeX-view-program-selection (quote ((output-pdf "pdf-tools"))))
 '(company-idle-delay 0.25)
 '(company-minimum-prefix-length 2)
 '(company-require-match nil)
 '(custom-enabled-themes (quote (sanityinc-tomorrow-day)))
 '(custom-safe-themes
   (quote
    ("4cf3221feff536e2b3385209e9b9dc4c2e0818a69a1cdb4b522756bcdf4e00a4" "4aee8551b53a43a883cb0b7f3255d6859d766b6c5e14bcb01bed572fcbef4328" "e3fc83cdb5f9db0d0df205f5da89af76feda8c56d79a653a5d092c82c7447e02" "4af6fad34321a1ce23d8ab3486c662de122e8c6c1de97baed3aa4c10fe55e060" "3b5ce826b9c9f455b7c4c8bff22c020779383a12f2f57bf2eb25139244bb7290" "2cfc1cab46c0f5bae8017d3603ea1197be4f4fff8b9750d026d19f0b9e606fae" "30f7c9e85d7fad93cf4b5a97c319f612754374f134f8202d1c74b0c58404b8df" "b9cbfb43711effa2e0a7fbc99d5e7522d8d8c1c151a3194a4b176ec17c9a8215" "291588d57d863d0394a0d207647d9f24d1a8083bb0c9e8808280b46996f3eb83" "628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" "bb08c73af94ee74453c90422485b29e5643b73b05e8de029a6909af6a3fb3f58" "1b8d67b43ff1723960eb5e0cba512a2c7a2ad544ddb2533a90101fd1852b426e" "82d2cac368ccdec2fcc7573f24c3f79654b78bf133096f9b40c20d97ec1d8016" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "bea5fd3610ed135e6ecc35bf8a9c27277d50336455dbdd2969809f7d7c1f7d79" "9a155066ec746201156bb39f7518c1828a73d67742e11271e4f24b7b178c4710" "43c1a8090ed19ab3c0b1490ce412f78f157d69a29828aa977dae941b994b4147" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" "e11569fd7e31321a33358ee4b232c2d3cf05caccd90f896e1df6cab228191109" default)))
 '(helm-command-prefix-key "M-,")
 '(helm-display-header-line nil)
 '(helm-echo-input-in-header-line t)
 '(helm-net-prefer-curl t)
 '(helm-split-window-default-side (quote below))
 '(helm-split-window-inside-p t)
 '(package-selected-packages
   (quote
    (helm-swoop color-theme-sanityinc-tomorrow try ace-window auto-org-md org-edna org-bullets company-emacs-eclim eclim pdf-tools markdown-mode magit cdlatex avy-flycheck aggressive-indent auctex company helm flycheck diminish use-package)))
 '(pdf-sync-forward-display-pdf-key "<C-return>" t)
 '(pdf-view-display-size (quote fit-page))
 '(reftex-plug-into-AUCTeX t t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(aw-leading-char-face ((t (:inherit ace-jump-face-foreground :height 3.0)))))
