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

  ;; (spaceline-define-segment me/helm-follow
  ;;   "Show `helm-follow-mode' status."
  ;;   (if (and (bound-and-true-p helm-alive-p)
  ;;            spaceline--helm-current-source
  ;;            (eq 1 (cdr (assq 'follow spaceline--helm-current-source))))
  ;; 		))

  (spaceline-define-segment me/selection-info
    "Show the size of current region."
    (when mark-active
      (let ((characters (- (region-end) (region-beginning)))
            (rows (count-lines (region-beginning) (min (1+ (region-end)) (point-max))))
            (columns (1+ (abs (- (spaceline--column-number-at-pos (region-end))
                                 (spaceline--column-number-at-pos (region-beginning)))))))
        (cond
         ((bound-and-true-p rectangle-mark-mode)
          (format "%d %d" (1- columns) rows))
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
  )



;;; mode-line.el ends here
