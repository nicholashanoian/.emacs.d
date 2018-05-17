;;Useful for changing themes
;;https://www.greghendershott.com/2017/02/emacs-themes.html#2017-02-06-emacs-themes-footnote-1-return

(defun gh/disable-all-themes ()
  (interactive)
  (mapc #'disable-theme custom-enabled-themes))

;;; Theme hooks

(defvar gh/theme-hooks nil
  "((theme-id . function) ...).")

(defun gh/add-theme-hook (theme-id hook-func)
  (add-to-list 'gh/theme-hooks (cons theme-id hook-func)))

(defun me/unboldify (&optional faces)
  "Set the weight property of FACES to `normal'.
If FACES is not provided or nil, use `face-list' instead."
  (interactive)
  (mapc (lambda (face)
          (when (eq (face-attribute face :weight) 'bold)
            (set-face-attribute face nil :weight 'normal)))
        (or faces (face-list))))

(defun gh/load-theme-advice (f theme-id &optional no-confirm no-enable &rest args)
  "Enhances `load-theme' in two ways:
1. Disables enabled themes for a clean slate.
2. Calls functions registered using `gh/add-theme-hook'."
  (unless no-enable
    (gh/disable-all-themes))
  (prog1
      (apply f theme-id no-confirm no-enable args)
    (unless no-enable
      (pcase (assq theme-id gh/theme-hooks)
        (`(,_ . ,f) (funcall f))))
	(powerline-reset)
	(me/unboldify)))





(advice-add 'load-theme
            :around
            #'gh/load-theme-advice)

(defhydra gh/themes-hydra (:hint nil :color pink)
  "
Themes

    ^Light^                  ^Dark^                     ^Other^
------------------------------------------------------------------
_s l_: Solarized L.      _s d_ Solarized D.            _n_: none
_m l_: Material L.       _m d_ Material D.
_l_: Leuven              _z_: Zenburn
_t d_: Tomorrow Day      _t n_: Tomorrow Night
^ ^                      _t e_: Tomorrow Eighties
"
  ("s d" (load-theme 'solarized-dark  t))
  ("s l" (load-theme 'solarized-light t))
  ("m d" (load-theme 'material        t))
  ("m l" (load-theme 'material-light  t))
  ("z" (load-theme 'zenburn         t))
  ("l" (load-theme 'leuven         t))
  ("t d" (load-theme 'sanityinc-tomorrow-day      t))
  ("t n" (load-theme 'sanityinc-tomorrow-night    t))
  ("t e" (load-theme 'sanityinc-tomorrow-eighties t))
  ("n" (progn (gh/disable-all-themes)(powerline-reset)))
  ("RET" nil "done" :color blue)
  ("C-g" nil "done" :color blue)
  ("q" nil "done" :color blue))

(bind-keys ("C-c w t"  . gh/themes-hydra/body))
