
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(setq user-init-file (or load-file-name (buffer-file-name)))
(setq user-emacs-directory (file-name-directory user-init-file))

;; Make the UI more minimal
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; Avoid the bell ring
(setq ring-bell-function 'ignore)

(setq custom-file "/Users/luisbg/tmp/learning_emacs/emacs-custom.el")
(load custom-file)

(ido-mode 1)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
;; (to get out of ido mode and be able to create a new file)
;; C-x C-f C-f

(set-cursor-color "chocolate")
(column-number-mode t)

;; Highlight current line
(global-hl-line-mode +1)

;; Highlight the matching parenthesis
;; if the matching isn't visible it highlights the expression
(show-paren-mode 1)
(setq show-paren-style 'mixed)

;; Move between windows with the meta key
(windmove-default-keybindings 'meta)

;; Change font size dynamically
(global-set-key [(control ?+)] 'text-scale-increase)
(global-set-key [(control ?-)] 'text-scale-decrease)

;; To make text wrap in only the current buffer
;; M-x visual-line-mode

;; Add our path to the load-path
(add-to-list 'load-path "~/tmp/learning_emacs/load_path/")

;; Any loaded package configuration needs to go after this line

;; color theme
(add-to-list 'custom-theme-load-path "~/tmp/learning_emacs/load_path/")
(load-theme 'cyberpunk t)
;; M-x color-theme-buffer-local

;; We need to bring more packages to have things like magit
(require 'package)
(add-to-list 'package-archives
	     '("melpa-stable" . "http://melpa.org/packages/") t)
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.org/packages/") t)
;; After this we still need to do: M-x package-refresh-contents

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
(setq org-log-done 'time)
(setq org-use-fast-todo-selection t)
(eval-after-load 'org
  (progn
    (define-key org-mode-map (kbd "<M-right>") nil)
    (define-key org-mode-map (kbd "<M-left>") nil)
    (define-key org-mode-map (kbd "<M-up>") nil)
    (define-key org-mode-map (kbd "<M-down>") nil)))
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

;; multiple eshells (easy but there are more convenient options)
(defun eshell-new()
  "Open a new instance of eshell."
  (interactive)
  (eshell 'N))

;; w3m
(setq w3m-default-display-inline-images t)

;; don't jump pages
(require 'smooth-scrolling)
(smooth-scrolling-mode 1)
(setq smooth-scroll-margin 3)
