
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(setq user-init-file (or load-file-name (buffer-file-name)))
(setq user-emacs-directory (file-name-directory user-init-file))

(tool-bar-mode -1)
(scroll-bar-mode -1)

(setq custom-file "/Users/luisbg/tmp/learning_emacs/.emacs-custom.el")
(load custom-file)

(ido-mode 1)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)

(set-cursor-color "chocolate")
(column-number-mode t)

(windmove-default-keybindings 'meta)

(add-to-list 'load-path "~/tmp/learning_emacs/load_path/")

;; Any loaded package configuration needs to go after this line

;; Org-mode
(add-hook 'org-mode-hook
    (lambda ()
      (org-indent-mode t))
    t)
(setq org-todo-keywords
      (quote ((sequence "TODO(t)" "NEXT(n)" "STARTED(s)" "|" "DONE(d)")
              (sequence "WAITING(w@/!)" "HOLD(h@/!)" "|" "CANCELLED(c@/!)" "MEETING"))))
(setq org-todo-keyword-faces
    '(("TODO" . org-warning)
      ("NEXT" . "blue")
      ("STARTED" . "yellow")
      ("WAITING" . "orange")
      ("HOLD" . "magenta")
      ("MEETING" . "forest green")
      ("CANCELLED" . (:foreground "blue" :weight bold))))
(setq org-use-fast-todo-selection t)

;; TRAMP mode
(setq tramp-default-method "ssh")

;; Other
(custom-set-variables
    '(eshell-visual-options (quote (("git" "log" "diff" "show"))))
)
