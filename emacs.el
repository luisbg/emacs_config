(set-default-font "DejaVu Sans Mono-12")
(add-to-list 'default-frame-alist '(font . "DejaVu Sans Mono-12"))
(load-theme 'tango-dark t)
(set-cursor-color "chocolate")

(setq shell-file-name "/bin/bash")

(setq load-home-init-file t) ;; don't load init file from ~/.xemacs/init.el

(setq load-path (cons "~/.emacs_load_path" load-path))
(load "~/.emacs_load_path/smooth-scrolling")
(load "~/.emacs_load_path/smart-tab")
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")

;; (require 'rust-mode)
(setq ring-bell-function 'ignore)

(ido-mode 1)
(setq ido-enable-flex-matching t)                       ;; ido mode
(setq ido-everywhere t)

(menu-bar-mode -1)
(tool-bar-mode -1)
(mouse-wheel-mode t)
(column-number-mode t)
(fset 'yes-or-no-p 'y-or-n-p)
(transient-mark-mode t)
(scroll-bar-mode -1)
(setq-default indent-tabs-mode nil)
(setq standard-indent 2)
(setq-default tab-width 2)
(setq indent-line-function 'insert-tab)
(show-paren-mode 1)
(set-background-color "black")

;; (global-set-key (kbd "M-left") 'windmove-left)          ;; move to left windnow
;; (global-set-key (kbd "M-right") 'windmove-right)        ;; move to right window
;; (global-set-key (kbd "M-up") 'windmove-up)              ;; move to upper window
;; (global-set-key (kbd "M-down") 'windmove-down)          ;; move to downer window
(global-set-key (kbd "C-<down>") 'other-frame)          ;; move to next frame
(windmove-default-keybindings 'meta)

(global-set-key (kbd "C-.") 'next-buffer)

(global-set-key (kbd "C-c C-m") 'magit-status)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(confirm-kill-emacs (quote yes-or-no-p))
 '(global-hl-line-mode t)
 '(inhibit-startup-screen t)
 '(org-agenda-ndays 7)
 '(org-agenda-show-all-dates t)
 '(org-agenda-skip-deadline-if-done t)
 '(org-agenda-skip-scheduled-if-done t))
(custom-set-faces
;;  ;; custom-set-faces was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(default ((t (:inherit nil :stipple nil :background "black" :foreground "gray70" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 90 :width normal :foundry "unknown" :family "DejaVu Sans Mono"))))
  '(hl-line ((t (:background "dark slate gray")))))
;;           ;; highlight focus line

(autoload 'magit-status "magit" nil t)
;; change magit diff colors
(eval-after-load 'magit
  '(progn
     (set-face-foreground 'magit-diff-add "green3")
     (set-face-foreground 'magit-diff-del "red3")
     (when (not window-system)
       (set-face-background 'magit-item-highlight "black"))))

(server-start)
;; (add-to-list 'auto-mode-alist '("/mutt" . mail-mode))

(require 'smart-tab)
(add-hook 'text-mode-hook
           (lambda ()
             (smart-tab-mode 1)))
(add-hook 'prog-mode-hook
           (lambda ()
             (smart-tab-mode 1)))

(require 'whitespace)
 (setq whitespace-style '(face empty tabs lines-tail trailing))
 (global-whitespace-mode t)

(if (window-system)
  (set-frame-height (selected-frame) 90))

(require 'compile)

(require 'fill-column-indicator)
  (setq fci-rule-width 1)
  (setq fci-rule-color "dark slate gray")
  (setq-default fill-column 80)
(define-globalized-minor-mode global-fci-mode fci-mode
  (lambda ()
    (if (and
         (not (string-match "^\*.*\*$" (buffer-name)))
         (not (eq major-mode 'org-mode)))
        (fci-mode 1))))
(global-fci-mode 1)

(require 'multi-term)
(setq multi-term-program "/usr/local/bin/fish")
(add-hook 'term-mode-hook
          (lambda ()
            (setq term-buffer-maximum-size 100000)))
(add-hook 'term-mode-hook
          (lambda()
            (setq yas-dont-activate t)
            (setq show-trailing-whitespace nil)))
(add-hook 'term-mode-hook
          (lambda ()
            (define-key term-raw-map (kbd "C-y") 'term-paste)))

(defcustom term-unbind-key-list
  '("C-z" "C-x" "C-c" "C-h" "C-y" "<ESC>" "<tab")
  "The key list that will need to be unbind."
  :type 'list
  :group 'multi-term)

(eval-after-load "multi-term"
  '(progn
     (defun term-send-quote ()
       (interactive)
       (term-send-raw-string "\C-v"))

     (defun term-send-M-x ()
       (interactive)
       (term-send-raw-string "\ex"))

     (defun term-send-backward-kill-word ()
       (interactive)
       (term-send-raw-string "\C-H"))

     (dolist
         (bind '(("C-<right>"     . term-send-forward-word)
                 ("C-<left>"      . term-send-backward-word)
                 ("C-<backspace>" . term-send-backward-kill-word)
                 ("C-<delete>"    . term-send-forward-kill-word)
                 ("C-k"           . term-send-raw)
                 ("C-y"           . term-send-raw)
                 ("C-c C-z"       . term-stop-subjob)
                 ("C-z"           . term-stop-subjob)
                 ;; work like urxvt tabbed
                 ("<S-down>"      . multi-term)
                 ("<S-left>"      . multi-term-prev)
                 ("<S-right>"     . multi-term-next)
                 ("C-v"           . term-paste)
                 ))
         (add-to-list 'term-bind-key-alist bind))))

;; (require 'google-maps)

;; (require 'eww)

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

;; (put 'dired-find-alternate-file 'disabled nil)

;; Also known as big-words, holla, yo-vinnie
(defun yo (yo)
  "Create and switch to a buffer whose text is gi-normous.
  Useful for signalling people across the room by showing them my
  laptop screen."
  (interactive "sSay yo!: ")
  (switch-to-buffer "yo")
  (text-scale-set 10)
  (visual-line-mode t)
  (erase-buffer)
  (insert wat))

;; View tags other window
(defun view-tag-other-window (tagname &optional next-p regexp-p)
  "Same as `find-tag-other-window' but doesn't move the point"
  (interactive (find-tag-interactive "View tag other window: "))
  (let ((window (get-buffer-window)))
    (find-tag-other-window tagname next-p regexp-p)
    (recenter 0)
    (select-window window)))

(require 'tramp)
(setq tramp-default-method "ssh")
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.


(require 'package)
(add-to-list 'package-archives
    '("marmalade" .
      "http://marmalade-repo.org/packages/"))
(package-initialize)

(require 'gst-debug)
(setq tags-table-list '("~/dev/gst/head"))

(defun toggle-margin-right ()
  "Toggle the right margin between `fill-column' or window width.
This command is convenient when reading novel, documentation."
  (interactive)
  (if (eq (cdr (window-margins)) nil)
      (set-window-margins nil 0 (- (window-body-width) fill-column))
    (set-window-margins nil 0 0) ) )

;; ace mode
(require 'ace-jump-mode)
(define-key global-map (kbd "C-x SPC") 'ace-jump-mode)

;; org mode
(require 'org)
;; Standard key bindings
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)
(eval-after-load 'org
  (progn
    (define-key org-mode-map (kbd "<M-right>") nil)
;;    (define-key org-agenda-mode-map (kbd "<M-right>") nil)
    (define-key org-mode-map (kbd "<M-left>") nil)
;;    (define-key org-agenda-mode-map (kbd "<M-left>") nil)
    (define-key org-mode-map (kbd "<M-up>") nil)
;;    (define-key org-agenda-mode-map (kbd "<M-up>") nil)
    (define-key org-mode-map (kbd "<M-down>") nil)))
;;    (define-key org-agenda-mode-map (kbd "<M-down>") nil)))
(setq org-log-done t)
(setq org-agenda-start-on-weekday nil)
(setq org-use-property-inheritance t)
(add-hook 'org-mode-hook
    (lambda ()
      (org-indent-mode t))
    t)
(setq org-mobile-directory "/goodgumbo@goodgumbo.baconseed.org#8080:notes")
(setq org-mobile-inbox-for-pull (concat org-directory "/index.org"))

(setq org-agenda-files (list "~/org/list.org"
    "~/org/emacs.org"
    "~/org/gstreamer.org"
    "~/org/linux.org"
    "~/org/org-mode.org"
    "~/org/osg.org"
    "~/org/personal.org"
    "~/org/refile.org"
    "~/org/other/watch_log.org"
    "~/org/wayland.org"))

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

(setq org-agenda-custom-commands
      ;; The " " here is the shortcut for this agenda, so `C-c a SPC`
      '((" " "Agenda"
         ((agenda "" nil)
          ;; All items with the "REFILE" tag, everything in refile.org
          ;; automatically gets that applied
          (tags "REFILE"
                ((org-agenda-overriding-header "Tasks to Refile")
                 (org-tags-match-list-sublevels nil)))
          ;; All "STARTED" todo items
          (todo "NEXT"
                ((org-agenda-overriding-header "To do Next")))
          ;; All "STARTED" todo items
          (todo "STARTED"
                ((org-agenda-overriding-header "In Progress")))
          ;; All Personal Tasks TODO
          (tags-todo "Personal+TODO=\"TODO\"+Category=\"Task\""
                 ((org-agenda-overriding-header "Personal TODO")
                 ;; sort by time, priority, and category
                 (org-agenda-sorting-strategy
                 '(time-up priority-down category-keep))))
          ;; All OSG Tasks TODO
          (tags-todo "OSG+TODO=\"TODO\"+Category=\"Task\""
                 ((org-agenda-overriding-header "OSG TODO")
                 ;; sort by time, priority, and category
                 (org-agenda-sorting-strategy
                 '(time-up priority-down category-keep))))
          ;; All GStreamer Tasks TODO
          (tags-todo "GStreamer+TODO=\"TODO\"+Category=\"Task\""
                 ((org-agenda-overriding-header "GStreamer TODO")
                 ;; sort by time, priority, and category
                 (org-agenda-sorting-strategy
                 '(time-up priority-down category-keep))))
          ;; All Linux Tasks TODO
          (tags-todo "Linux+TODO=\"TODO\"+Category=\"Task\""
                 ((org-agenda-overriding-header "Linux TODO")
                 ;; sort by time, priority, and category
                 (org-agenda-sorting-strategy
                 '(time-up priority-down category-keep))))
          ;; All emacs Tasks TODO
          (tags-todo "emacs+TODO=\"TODO\"+Category=\"Task\""
                 ((org-agenda-overriding-header "emacs TODO")
                 ;; sort by time, priority, and category
                 (org-agenda-sorting-strategy
                 '(time-up priority-down category-keep))))
            ;; Everything on hold
          (todo "HOLD"
                ((org-agenda-overriding-header "On hold"))))
         nil)))

(defun org-agenda-timeline-all (&optional arg)
  (interactive "P")
  (with-temp-buffer
    (dolist (org-agenda-file org-agenda-files)
      (insert-file-contents org-agenda-file nil)
      (end-of-buffer)
      (newline))
    (write-file "/tmp/timeline.org")
    (org-agenda arg "L")))
(define-key org-mode-map (kbd "C-c t") 'org-agenda-timeline-all)

(defun my/org-archive-done-tasks ()
  "Archive finished or cancelled tasks."
  (interactive)
  (org-map-entries
   (lambda ()
     (org-archive-subtree)
     (setq org-map-continue-from (outline-previous-heading)))
   "TODO=\"DONE\"|TODO=\"CANCELLED\"" (if (org-before-first-heading-p) 'file 'tree)))

;; navigate using brackets (for coding blocks)
(defvar xah-left-brackets  nil "list of open bracket chars.")
(setq xah-left-brackets '("{"))
(defvar xah-right-brackets nil "list of close bracket chars.")
(setq xah-right-brackets '("}"))

(defun xah-backward-left-bracket ()
  "Move cursor to the previous occurrence of left bracket. The list of brackets
    to jump to is defined by `xah-left-brackets'."
  (interactive)
  (search-backward-regexp (eval-when-compile (regexp-opt xah-left-brackets)) nil t))

(defun xah-forward-right-bracket ()
  "Move cursor to the next occurrence of right bracket. The list of brackets to
    jump to is defined by `xah-right-brackets'."
  (interactive)
  (search-forward-regexp (eval-when-compile (regexp-opt xah-right-brackets)) nil t))

(global-set-key (kbd "<home>") 'xah-backward-left-bracket)
(global-set-key (kbd "<end>") 'xah-forward-right-bracket)

(setq ediff-split-window-function 'split-window-horizontally)

(require 'xcscope)
(setq-default frame-title-format
   (list '((buffer-file-name " %f"
             (dired-directory
              dired-directory
              (revert-buffer-function " %b"
              ("%b - Dir:  " default-directory)))))))
(setq c-default-style "linux")

;; Change font size dynamically
(global-set-key [C-mouse-4] 'text-scale-increase)
(global-set-key [(control ?+)] 'text-scale-increase)
(global-set-key [C-mouse-5] 'text-scale-decrease)
(global-set-key [(control ?-)] 'text-scale-decrease)

(require 'indent-guide)
(add-hook 'prog-mode-hook
  (lambda ()
    (indent-guide-mode 1)))
(set-face-foreground 'indent-guide-face "dark slate gray")
(setq indent-guide-delay 0.0)

(defun indentation-fold ()
  "Toggle fold all lines larger than indentation on current line"
  (interactive)
  (let ((col 1))
    (save-excursion
      (back-to-indentation)
      (setq col (+ 1 (current-column)))
      (set-selective-display
       (if selective-display nil (or col 1))))))
(global-set-key (kbd "<backtab>") 'indentation-fold)

(global-set-key (kbd "C-0") 'hs-hide-block)
(global-set-key (kbd "C-9") 'hs-show-block)
(global-set-key (kbd "C-8") 'hs-show-all)

(require 'which-key)
(which-key-mode)
