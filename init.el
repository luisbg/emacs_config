
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
;; (to get out of ido mode and be able to create a new file)
;; C-x C-f C-f

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

;; Swap right and left windows
(require 'cl)
(defun swap-windows ()
    "If you have 2 windows, it swaps them."
    (interactive)
    (cond ((not (= (count-windows) 2))
        (message "You need exactly 2 windows to do this."))
        (t
        (let* ((w1 (first
                        (window-list)
                    )
                )
                (w2
                    (second
                        (window-list)
                    )
                )
                (b1 (window-buffer w1))
                (b2 (window-buffer w2))
                (s1 (window-start w1))
                (s2
                    (window-start w2)
                )
            )

            (set-window-buffer w1 b2)
            (set-window-buffer w2 b1)
            (set-window-start w1 s2)
            (set-window-start w2 s1)

            ; re-select the previously selected buffer
            (if (eq (selected-window) w1)
            (select-window w2)
            (select-window w1))))))
