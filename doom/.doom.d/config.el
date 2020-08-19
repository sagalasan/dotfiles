;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Christiaan Martinez"
      user-mail-address "cmdmdsm@gmail.com")

(setq confirm-kill-emacs nil)

(add-to-list 'initial-frame-alist '(fullscreen . maximized))

(setq request-backend 'url-retrieve)

(setq doom-leader-alt-key "M-m")
;;(setq doom-localleader-alt-key "M-m l")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 14))
(setq doom-font (font-spec :family "Source Code Pro" :size 13))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/Documents/org/")
;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c g k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c g d') to jump to their definition and see how
;; they are implemented.

(use-package! org
  :mode ("\\.org\\'" . org-mode)
  :init
  (define-key global-map "\C-cl" 'org-store-link)
  (define-key global-map "\C-ca" 'org-agenda)
  (define-key global-map "\C-cc" 'org-capture)
  )

(after! org
  (require 'org-tempo)
  
  ;; org-agenda will show up in the right window
  (setq org-agenda-window-setup 'reorganize-frame)

  (setq +popup-mode nil)
  ;; disalbe defadvice in doom-emacs
  ;; (advice-remove '+popup--suppress-delete-other-windows-a ')

  ;; ensure shift select does not modify org content
  (setq org-support-shift-select t)

  ;; set org agenda files
  (setq org-agenda-files '("~/Documents/org/inbox.org"
                           "~/Documents/org/gtd.org"
                           "~/Documents/org/tickler.org"
                           "~/Documents/org/projects"))

  ;; My org capture templates
  (setq org-capture-templates '(("t" "Todo [inbox]" entry
                                 (file+headline "~/Documents/org/inbox.org" "Tasks")
                                 "* TODO %i%? \n DEADLINE: %T")
                                ("m" "Meeting" entry
                                 (file+headline "~/Documents/org/inbox.org" "Meetings")
                                 "* Meeting with '%?' :MEETING:\n%U" :clock-in t :clock-resume t)
                                ("p" "Phone call" entry
                                 (file+headline "~/Documents/org/inbox.org" "Phone Call")
                                 "* Phone Call with '%?' :PHONE:\n%U" :clock-in t :clock-resume t)
                                ("T" "Tickler" entry
                                 (file+headline "~/Documents/org/tickler.org" "Tickler")
                                 "* TODO %i%? \n DEADLINE: %T")))

  ;; Refile
  (setq org-refile-targets '((nil :maxlevel . 9)
                             (org-agenda-files :maxlevel . 9)))

  ;; Use full outline paths for refile targets
  (setq org-refile-use-outline-path t)

  ;; Targets complete directly with IDO
  ;; (setq org-outline-path-complete-in-steps nil)

  ;; Allow refile to create parent tasks with confirmation
  (setq org-refile-allow-creating-parent-nodes (quote confirm))

  ;; Use IDO for both buffer and file completion and ido-everywhere to t
  ;; (setq org-completion-use-ido t)
  ;; (setq ido-everywhere t)
  ;; (setq id-max-directorys-size 100000)
  ;; (ido-mode (quote both))

  ;; Use the current window when visting files and buffers with ido
  ;; (setq ido-default-file-method 'selected-window)
  ;; (setq ido-default-buffer-method 'selected-window)

  ;; Use the current window for indirect buffer display
  (setq org-indirect-buffer-display 'current-window)

  (setq org-todo-keywords '((sequence "TODO(t)" "WAITING(w)" "|" "DONE(d)" "CANCELLED(c)")))
  (setq org-startup-folded nil)
  (setq org-export-with-timestamps t)
  (setq org-export-with-planning t)
  (setq org-agenda-span 21)
  (setq org-agenda-start-on-weekday nil)
  (setq org-agenda-start-day "-2Sun")

  ;; Ensure that agenda fonts stay the same
  (custom-set-faces
   '(org-agenda-done ((t (:foreground "#86dc2f" :height 1.0)))))
  (custom-set-faces
   '(org-scheduled-today ((t (:foreground "#bc6ec5" :height 1.0)))))

  ;; Template for note taking
  (tempo-define-template "notes-settings"
                         '("#+OPTIONS:    H:3 num:nil toc:nil \\n:nil" n
                           "#+TITLE: " p n
                           "#+AUTHOR: Christiaan Martinez" n
                           "#+EMAIL: cmdmdsm@gmail.com" n
                           "#+LANGUAGE: en" n
                           "#+ODT_STYLES_FILE: \"~/Documents/org/odt_styles/OrgOdtStyles.xml\"")
                         "<notes"
                         "Insert notes settings")

  )

(after! smartparens
  ;; Remove keybindings from smartparens-mode-map
  (define-key smartparens-mode-map (kbd "<M-left>") nil)
  (define-key smartparens-mode-map (kbd "<M-right>") nil)
  (define-key smartparens-mode-map (kbd "<C-left>") nil)
  (define-key smartparens-mode-map (kbd "<C-right>") nil)

  ;; Use meta-arrow to move windows
  (windmove-default-keybindings 'meta)
  )
