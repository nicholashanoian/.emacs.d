;;; package --- Summary
;;; Commentary:
;; https://github.com/angrybacon/dotemacs/blob/master/dotemacs.org#mode-line--spaceline
;;; Code:
(print "loading nhh-custom")
(defvar me/font-family            "Bitstream Vera Sans Mono" "The font to use.")
(defvar me/font-size-default      110        "The font size to use for default text.")
(defvar me/font-size-header-line  120        "The font size to use for the header-line.")
(defvar me/font-size-mode-line    110        "The font size to use for the mode-line.")
(defvar me/font-size-title        140        "The font size to use for titles.")

;; (use-package delight
;;   :ensure nil
;;   :preface
;;   (defun me/delight-powerline-major-mode (original-function &rest arguments)
;; 	(let ((inhibit-mode-name-delight nil)) (apply original-function arguments)))
;;   (defun me/delight-powerline-minor-mode (original-function &rest arguments)
;; 	(let ((inhibit-mode-name-delight nil)) (apply original-function arguments)))
;;   :config
;;   (advice-add 'powerline-major-mode :around #'me/delight-powerline-major-mode)
;;   (advice-add 'powerline-minor-mode :around #'me/delight-powerline-minor-mode))

;; (use-package mdi
;;   :demand t
;;   :load-path "~/.emacs.d/nhh-lisp/mdi")

(use-package powerline
  :ensure t)

(use-package spaceline
  :ensure t
  :config
  (spaceline-define-segment me/erc-track
    "Show the ERC buffers with new messages."
    (when (bound-and-true-p erc-track-mode)
      (mapcar (lambda (buffer)
                (format "%s%s%s"
                        (buffer-name (pop buffer))
                        erc-track-showcount-string
                        (pop buffer)))
              erc-modified-channels-alist)))

  (spaceline-define-segment me/helm-follow
    "Show `helm-follow-mode' status."
    (if (and (bound-and-true-p helm-alive-p)
             spaceline--helm-current-source
             (eq 1 (cdr (assq 'follow spaceline--helm-current-source))))
  		(propertize (mdi "eye") 'face 'success)
  	  (propertize (mdi "eye-off") 'face 'warning)
  	  ))

  (spaceline-define-segment me/selection-info
    "Show the size of current region."
    (when mark-active
      (let ((characters (- (region-end) (region-beginning)))
            (rows (count-lines (region-beginning) (min (1+ (region-end)) (point-max))))
            (columns (1+ (abs (- (spaceline--column-number-at-pos (region-end))
                                 (spaceline--column-number-at-pos (region-beginning)))))))
        (cond
         ((bound-and-true-p rectangle-mark-mode)
          (format "%d %s %d" (1- columns) (mdi "arrow-expand-all") rows))
         ((> rows 1)
          (format "%d" (if (eq (current-column) 0) (1- rows) rows)))
         (t (format "%d" characters))))))

  (spaceline-define-segment me/version-control
    "Show the current version control branch."
    (when vc-mode
      (substring vc-mode (+ 2 (length (symbol-name (vc-backend buffer-file-name))))))))



(use-package spaceline-config
  :demand t
  :ensure nil
  :config
  

  
  ;; Configure the mode-line
  (setq-default
   mode-line-format '("%e" (:eval (spaceline-ml-main)))
   powerline-default-separator 'arrow
   ;; powerline-height 30
   spaceline-highlight-face-func 'spaceline-highlight-face-modified
   ;;spaceline-flycheck-bullet (format "%s %s" (mdi "record") "%s")
   spaceline-separator-dir-left '(left . left)
   spaceline-separator-dir-right '(right . right))
  (spaceline-helm-mode 1)

  ;; Build the mode-lines
  (spaceline-install
    '((major-mode :face highlight-face)
      ((remote-host buffer-id line) :separator ":")
      ((flycheck-error flycheck-warning flycheck-info))
      (me/selection-info))

    '((me/erc-track :face spaceline-highlight-face :when active)
      (anzu)
      ((projectile-root me/version-control) :separator ":")
      (workspace-number)
	  
      (global :face highlight-face)))
  (spaceline-install
    'helm
    '((helm-buffer-id :face spaceline-read-only)
      (helm-number)
      (me/helm-follow)
      (helm-prefix-argument))
	;; '(minor-modes :when active
    ;;               :priority 9)
    '((me/erc-track :face spaceline-highlight-face :when active)
      (workspace-number)
      (global :face spaceline-read-only))
	;; '((buffer-id remote-host)
	;;   :priority 98)
	)

  ;; Customize the mode-line
  (let*
	  ((zenburn-fg+1      "#FFFFEF")
	   (zenburn-fg        "#DCDCCC")
	   (zenburn-fg-1      "#656555")
	   (zenburn-bg-2      "#000000")
	   (zenburn-bg-1      "#2B2B2B")
	   (zenburn-bg-05     "#383838")
	   (zenburn-bg        "#3F3F3F")
	   (zenburn-bg+05     "#494949")
	   (zenburn-bg+1      "#4F4F4F")
	   (zenburn-bg+2      "#5F5F5F")
	   (zenburn-bg+3      "#6F6F6F")
	   (zenburn-red+2     "#ECB3B3")
	   (zenburn-red+1     "#DCA3A3")
	   (zenburn-red       "#CC9393")
	   (zenburn-red-1     "#BC8383")
	   (zenburn-red-2     "#AC7373")
	   (zenburn-red-3     "#9C6363")
	   (zenburn-red-4     "#8C5353")
	   (zenburn-red-5     "#7C4343")
	   (zenburn-red-6     "#6C3333")
	   (zenburn-orange    "#DFAF8F")
	   (zenburn-yellow    "#F0DFAF")
	   (zenburn-yellow-1  "#E0CF9F")
	   (zenburn-yellow-2  "#D0BF8F")
	   (zenburn-green-5   "#2F4F2F")
	   (zenburn-green-4   "#3F5F3F")
	   (zenburn-green-3   "#4F6F4F")
	   (zenburn-green-2   "#5F7F5F")
	   (zenburn-green-1   "#6F8F6F")
	   (zenburn-green     "#7F9F7F")
	   (zenburn-green+1   "#8FB28F")
	   (zenburn-green+2   "#9FC59F")
	   (zenburn-green+3   "#AFD8AF")
	   (zenburn-green+4   "#BFEBBF")
	   (zenburn-cyan      "#93E0E3")
	   (zenburn-blue+3    "#BDE0F3")
	   (zenburn-blue+2    "#ACE0E3")
	   (zenburn-blue+1    "#94BFF3")
	   (zenburn-blue      "#8CD0D3")
	   (zenburn-blue-1    "#7CB8BB")
	   (zenburn-blue-2    "#6CA0A3")
	   (zenburn-blue-3    "#5C888B")
	   (zenburn-blue-4    "#4C7073")
	   (zenburn-blue-5    "#366060")
	   (zenburn-magenta   "#DC8CC3"))
	
	(set-face-attribute 'powerline-active2 nil :background zenburn-bg+05)
	(set-face-attribute 'powerline-inactive2 nil :background zenburn-bg)
	(set-face-attribute 'spaceline-flycheck-error nil :foreground zenburn-red)
	(set-face-attribute 'spaceline-flycheck-info nil :foreground zenburn-blue+1)
	(set-face-attribute 'spaceline-flycheck-warning nil :foreground zenburn-orange)
	(set-face-attribute 'spaceline-highlight-face nil
						:background zenburn-yellow
						:foreground zenburn-fg-1)
	(set-face-attribute 'spaceline-modified nil
						:background zenburn-red
						:foreground zenburn-red-4)
	(set-face-attribute 'spaceline-read-only nil
						:background zenburn-blue+1
						:foreground zenburn-blue-5)
	(set-face-attribute 'spaceline-unmodified nil
						:background zenburn-green-1
						:foreground zenburn-green+4)))



;;; mode-line.el ends here
