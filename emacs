(setq shell-file-name "/bin/bash")

(setq load-home-init-file t) ;; don't load init file from ~/.xemacs/init.el

(setq load-path (cons "~/.emacs_load_path" load-path))
(load "~/.emacs_load_path/smooth-scrolling")
(load "~/.emacs_load_path/smart-tab")
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")

;; (require 'rust-mode)

(load "~/.emacs_load_path/color-theme-subdued.el")
(require 'color-theme-subdued)
(color-theme-subdued)

(set-default-font "Monospace-9")
(add-to-list 'default-frame-alist '(font . "Monospace-9"))

(setq ring-bell-function 'ignore)

(ido-mode 1)
(setq ido-enable-flex-matching t)                       ;; ido mode
(setq ido-everywhere t)

;; (define-key global-map (kbd "RET") 'newline-and-indent) ;; autoindent with the return key

;; (setq next-line-add-newlines t) ;; add new line with C-n if we are in the last line

(menu-bar-mode -1)
(tool-bar-mode -1)
(mouse-wheel-mode t)
(column-number-mode t)
(fset 'yes-or-no-p 'y-or-n-p)
(transient-mark-mode t)
(scroll-bar-mode -1)
(setq-default indent-tabs-mode nil)
(setq standard-indent 2)
(setq-default tab-width 4)
(setq indent-line-function 'insert-tab)

;; (global-set-key (kbd "M-left") 'windmove-left)          ;; move to left windnow
;; (global-set-key (kbd "M-right") 'windmove-right)        ;; move to right window
;; (global-set-key (kbd "M-up") 'windmove-up)              ;; move to upper window
;; (global-set-key (kbd "M-down") 'windmove-down)          ;; move to downer window
(windmove-default-keybindings 'meta)

(global-set-key (kbd "C-.") 'next-buffer)

(global-set-key (kbd "C-c C-m") 'magit-status)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(confirm-kill-emacs (quote yes-or-no-p))
 '(custom-safe-themes (quote ("68769179097d800e415631967544f8b2001dae07972939446e21438b1010748c" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "e16a771a13a202ee6e276d06098bc77f008b73bbac4d526f160faa2d76c1dd0e" "471877df61bcd989ba4c0a5097654684fcfe918e124d46f811b533e44df34f53" default)))
 '(global-hl-line-mode t)
 '(inhibit-startup-screen t)
 '(mpc-mpd-music-directory "~/music/"))
;; (custom-set-faces
;;  ;; custom-set-faces was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(default ((t (:inherit nil :stipple nil :background "black" :foreground "gray70" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 90 :width normal :foundry "unknown" :family "DejaVu Sans Mono"))))
;;  '(hl-line ((t (:background "gray3")))))
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
;; (global-whitespace-mode t)

(if (window-system)
  (set-frame-height (selected-frame) 90))

(require 'compile)

(require 'fill-column-indicator)
(setq fci-rule-width 1)
  (setq fci-rule-color "gray10")
  (setq-default fill-column 80)
(add-hook 'after-change-major-mode-hook 'fci-mode)

(require 'multi-term)
 (setq multi-term-program "/bin/fish")
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
(custom-set-faces)
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

(defun toggle-margin-right ()
  "Toggle the right margin between `fill-column' or window width.
This command is convenient when reading novel, documentation."
  (interactive)
  (if (eq (cdr (window-margins)) nil)
      (set-window-margins nil 0 (- (window-body-width) fill-column))
    (set-window-margins nil 0 0) ) )
