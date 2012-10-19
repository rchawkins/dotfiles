;; Don't show the startup screen
(setq inhibit-startup-screen t)

;; "y or n" instead of "yes or no"
(fset 'yes-or-no-p 'y-or-n-p)

;; Highlight regions and add special behaviors to regions.
;; "C-h d transient" for more info
(setq transient-mark-mode t)

;; Display line and column numbers
(setq line-number-mode    t)
(setq column-number-mode  t)

(show-paren-mode t)

;; Don't truncate lines
(setq truncate-lines t)
(setq truncate-partial-width-windows nil)

;; save backups to a single location
(setq backup-directory-alist `(("." ., (concat user-emacs-directory "emacs_backup"))))

;; Prevent the annoying beep on errors
(setq visible-bell t)

;; Don't truncate lines
(setq truncate-lines t)
(setq truncate-partial-width-windows nil)

;; Trailing whitespace is unnecessary
(add-hook 'before-save-hook (lambda () (whitespace-cleanup)))

;; turn off toolbar, menubar, scroll bar
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;; no tabs
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

;; scrolling tweaks
(setq scroll-conservatively 10)
(setq scroll-margin 5)
