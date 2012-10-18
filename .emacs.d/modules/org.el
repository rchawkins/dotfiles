;;; org-mode

(require 'org-install)
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

;; set agenda files
(setq org-agenda-files (list "~/org/work.org"))
;;(setq org-hide-leading-stars nil)

(setq org-directory "~/org/")
(setq org-default-notes-file (concat org-directory "notes.org"))
(setq org-default-notes-file "~/org/notes.org")

(setq org-capture-templates
      '(("t" "Todo" entry (file+headline "~/org/work.org" "incoming")
             "* TODO %?\n  %i")
        ("n" "Note" entry (file+datetree "~/org/notes.org")
             "* %?\nEntered on %U\n  %i\n  %a")
        ("i" "Idea" entry (file+datetree "~/org/ideas.org")
             "* %?\nEntered on %U\n  %i\n")
        ("m" "meetings" entry (file+datetree "~/org/meetings.org")
             "* %?\nEntered on %U\n  %i\n")))

(setq org-todo-keywords
       '((sequence "TODO" "IN_PROGRESS" "DONE")))

;; any headline with level <= :maxlevel is a target
(setq org-refile-targets '((nil :maxlevel . 5)))

(setq org-refile-use-outline-path t)
