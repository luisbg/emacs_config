(setq shell-file-name "/bin/bash")

(setq load-home-init-file t) ;; don't load init file from ~/.xemacs/init.el

(setq load-path (cons "~/.emacs_load_path" load-path))
(load "~/.emacs_load_path/smooth-scrolling")
(load "~/.emacs_load_path/smart-tab")
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")

;; (require 'rust-mode)

(set-default-font "DejaVu Sans Mono-10")
(add-to-list 'default-frame-alist '(font . "DejaVu Sans Mono-10"))
(load-theme 'subdued t)
(set-cursor-color "#000080")

(setq ring-bell-function 'ignore)

(ido-mode 1)
(setq ido-enable-flex-matching t)                       ;; ido mode
(setq ido-everywhere t)

(define-key global-map (kbd "RET") 'electric-newline-and-maybe-indent) ;; autoindent with the return key

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
(show-paren-mode 1)

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
 '(custom-safe-themes
   (quote
    ("b52009e1421bf4ba634ccab012e5370d78f542638337a903ed4183faf76a87b1" "1affe85e8ae2667fb571fc8331e1e12840746dae5c46112d5abb0c3a973f5f5a" "ba6d1d0587a4ee00914a1c31b6090a40cd69ad7bef6ada483bfca9e5902ce75e" "9365d9fc5210d51aeb1a603fad6b31ae2a7673ce97edf3e93ba6f63652dd6a76" "d488ad694b90903cafff0a0f952875cf6a2a9010c2676f0d9d70f0ab40e57d69" "de2c46ed1752b0d0423cde9b6401062b67a6a1300c068d5d7f67725adc6c3afb" "0ddbb18993d95c318e13ff12e73a894d1198fa6a6fc7c3b8d5c04c648105747a" "bb08c73af94ee74453c90422485b29e5643b73b05e8de029a6909af6a3fb3f58" "98e5e942303b4f356d6573009c96087f9b872f2fa258c673188d913f6faf17ea" "41b6698b5f9ab241ad6c30aea8c9f53d539e23ad4e3963abff4b57c0f8bf6730" "51bea7765ddaee2aac2983fac8099ec7d62dff47b708aa3595ad29899e9e9e44" "f41fd682a3cd1e16796068a2ca96e82cfd274e58b978156da0acce4d56f2b0d5" "405fda54905200f202dd2e6ccbf94c1b7cc1312671894bc8eca7e6ec9e8a41a2" "e53cc4144192bb4e4ed10a3fa3e7442cae4c3d231df8822f6c02f1220a0d259a" "978ff9496928cc94639cb1084004bf64235c5c7fb0cfbcc38a3871eb95fa88f6" "ae8d0f1f36460f3705b583970188e4fbb145805b7accce0adb41031d99bd2580" "9bac44c2b4dfbb723906b8c491ec06801feb57aa60448d047dbfdbd1a8650897" "234249a92c2cf7b61223d9f83e1d9eefcd80fcf6b7a5e9ca03dc9d3f1b122ae2" "17a8fa9430ffd81f242ed3ee95e59629ccf9e1210657536013a0def9b16e68c9" "beeb4fbb490f1a420ea5acc6f589b72c6f0c31dd55943859fc9b60b0c1091468" "bbb51078321186cbbbcb38f9b74ea154154af10c5d9c61d2b0258cb4401ac038" "2c50bf38069a99a18404275e8d139a8a1019a629dab4be9b92b8d5d9c43bbb92" "f07583bdbcca020adecb151868c33820dfe3ad5076ca96f6d51b1da3f0db7105" "50d8de7ef10b93c4c7251888ff845577004e086c5bfb2c4bb71eca51b474063a" "68769179097d800e415631967544f8b2001dae07972939446e21438b1010748c" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "e16a771a13a202ee6e276d06098bc77f008b73bbac4d526f160faa2d76c1dd0e" "471877df61bcd989ba4c0a5097654684fcfe918e124d46f811b533e44df34f53" default)))
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

;; for Arch
;; (add-to-list 'auto-mode-alist '("PKGBUILD" . shell-script-mode))
(autoload 'pkgbuild-mode "pkgbuild-mode.el" "PKGBUILD mode." t)
(setq auto-mode-alist (append '(("/PKGBUILD$" . pkgbuild-mode)) auto-mode-alist))

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
