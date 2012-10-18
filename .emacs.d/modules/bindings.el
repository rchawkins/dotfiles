;; from effective emacs:
;; https://sites.google.com/site/steveyegge2/effective-emacs
; M-x replacement
(global-set-key "\C-x\C-m" 'execute-extended-command)
(global-set-key "\C-c\C-m" 'execute-extended-command)

(global-set-key "\C-w" 'backward-kill-word)
(global-set-key "\C-x\C-k" 'kill-region)
(global-set-key "\C-c\C-k" 'kill-region)

;; use ibuffer
(global-set-key (kbd "C-x C-b") 'ibuffer)
