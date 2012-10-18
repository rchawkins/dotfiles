;; structure copied from here: https://github.com/rmm5t/dotfiles

(setq custom-file "~/.emacs.d/modules/custom.el")
(load custom-file 'noerror)

(add-to-list 'load-path "~/.emacs.d")

(load "modules/bindings")
(load "modules/global")
(load "modules/ido")
(load "modules/org")
(load "modules/theme")
(load "modules/uniquify")
