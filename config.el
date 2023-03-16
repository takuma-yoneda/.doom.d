;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-


;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Takuma Yoneda"
      user-mail-address "takuma.ynd@gmail.com")

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
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/Synced/google-drive/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)


;; (use-package display-line-numbers
;;   :ensure nil
;;   :init
;;   (setq display-line-numbers-width-start t)
;;   (setq display-line-numbers-type t)
;;   (global-display-line-numbers-mode))

;; dired
(after! dired-rsync
  (setq-default dired-rsync-unmark-on-completion nil)
  (setq-default dired-rsync-options "-az --info=progress2 --update")
  )

;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

(add-to-list 'default-frame-alist '(inhibit-double-buffering . t))

;; Change font (https://github.com/hlissner/doom-emacs/blob/develop/docs/faq.org#how-do-i-change-the-fonts)
;; (setq doom-font (font-spec :family "Fira Code" :size 11 :weight 'semi-light)
;; (setq doom-font (font-spec :family "Fira Code" :slant 'normal :size 11 :weight 'normal)
;;       doom-variable-pitch-font (font-spec :family "Fira Code") ; inherits `doom-font''s :size
;;       doom-unicode-font (font-spec :family "Fira Code" :size 11)
;;       doom-big-font (font-spec :family "Fira Code" :size 19))


;; Temporarily try this:
(setq doom-font (font-spec :family "JetBrains Mono" :size 12)
      doom-big-font (font-spec :family "JetBrains Mono" :size 18)
      doom-variable-pitch-font (font-spec :family "Overpass" :size 12)
      doom-unicode-font (font-spec :family "JuliaMono")
      doom-serif-font (font-spec :family "IBM Plex Mono" :weight 'light))

;; (setq doom-font (font-spec :family "Hack" :size 11 :weight 'normal)
;;       doom-variable-pitch-font (font-spec :family "Hack") ; inherits `doom-font''s :size
;;       doom-unicode-font (font-spec :family "Hack" :size 11)
;;       doom-big-font (font-spec :family "Hack" :size 19))
(setq doom-unicode-font doom-font)


;; Several tricks to make emacs faster on Mac
;; ref: https://github.com/hlissner/doom-emacs/issues/2217

;; hl-line+ works much faster
;; (use-package! hl-line-plus
;;   :config
;;   (hl-line-when-idle-interval 0.3)
;;   (toggle-hl-line-when-idle 1)
;;   (set-face-background hl-line-face "Black")

;;   ;; The way to disable global-hl-line-mode ((setq-default global-hl-line-mode nil) does NOT work!)
;;   ;; https://github.com/hlissner/doom-emacs/issues/4206#issuecomment-734414502
;;   (remove-hook 'doom-first-buffer-hook #'global-hl-line-mode))


;; Better defaults (https://tecosaur.github.io/emacs-config/config.html#better-defaults)
(setq
 evil-want-fine-undo t          ; By default while in insert all changes are one big blob. Be more granular
 truncate-string-ellipsis "…")  ; Unicode ellispis are nicer than "...", and also save /precious/ space

(global-subword-mode +1)
(setq-default evil-escape-key-sequence "fd")  ; Exit insert state with fd (just like spacemacs)

;; Set default frame size
(add-to-list 'default-frame-alist '(height . 24))
(add-to-list 'default-frame-alist '(width . 80))

;; Use orange color in modeline to note for unsaved buffer
(custom-set-faces!
  '(doom-modeline-buffer-modified :foreground "orange"))

;; Use simpler keys in dashboard
(map! :map +doom-dashboard-mode-map
      :ne "f" #'find-file
      :ne "r" #'counsel-recentf
      :ne "p" #'counsel-projectile-switch-project
      :ne "P" #'doom/open-private-config
      :ne "c" (cmd! (find-file (expand-file-name "config.el" doom-private-dir)))
      :ne "i" (cmd! (find-file (expand-file-name "init.el" doom-private-dir)))
      :ne "." (cmd! (doom-project-find-file "~/.config/")) ; . for dotfiles
      :ne "b" #'+ivy/switch-workspace-buffer
      :ne "B" #'+ivy/switch-buffer
      :ne "q" #'save-buffers-kill-terminal)

;; whichkey setup
(setq
 which-key-idle-delay 0.5
 which-key-idle-secondary-delay 0.1
 which-key-allow-evil-operators nil)

(setq-default history-length 1000
              prescient-history-length 1000)

;; Nested snippets are good, so let’s enable that.
(setq yas-triggers-in-field t)

;; Colorize info page
(use-package! info-colors
  :commands (info-colors-fontify-node)
  :config (add-hook 'Info-selection-hook 'info-colors-fontify-node))


(map! :leader
      (:prefix "t"
        :desc "Rotate text"           "t" #'rotate-text
        :desc "Rotate text backward"  "T" #'rotate-text-backward))

(use-package! python-black
  :demand t
  :after python)

;; (use-package! company-tabnine)
;; (set-company-backend! 'python-mode #'company-tabnine)
;; I'm not sure why, but this is overwritten somewhere (maybe in anaconda-mode config.el?)
;; (set-company-backend! 'anaconda-mode '(company-tabnine
;;                                        :separate company-anaconda))
;; On the other hand, this works fine :)
;; (set-company-backend! 'python-mode '(company-tabnine
;;                                        :with company-anaconda))
;; (add-to-list 'company-backends #'company-tabnine)

;; (use-package beacon
;;     :custom
;;     (beacon-color "yellow")
;;     :config
;;     (beacon-mode 1))
;; (use-package highlight-indent-guides
;;   :delight highlight-indent-guides-mode
;;   :init
;;   (setq highlight-indent-guides-method 'character
;;         ;; default is \x2502 but it is very slow on Mac
;;         highlight-indent-guides-character ?\xFFE8
;;         highlight-indent-guides-responsive 'top))

;; Show the current function name in the header line
;; 20211206 --- Deprecating it as I started to use lsp-headerline-breadcrumb
;; (defun activate-which-function-mode ()
;;   (which-function-mode)
;;   (setq which-func-unknown "n/a")
;;   (setq-default header-line-format
;;                 '((which-func-mode ("" which-func-format " "))))
;;   (setq mode-line-misc-info
;;         ;; We remove Which Function Mode from the mode line, because it's mostly
;;         ;; invisible here anyway.
;;         (assq-delete-all 'which-function-mode mode-line-misc-info))
;;   )

;; (add-hook 'python-mode-hook #'activate-which-function-mode)

;; This is said to fix some issues on MacOS (https://github.com/pythonic-emacs/anaconda-mode#faq)
;; Also look at this issue: https://github.com/pythonic-emacs/anaconda-mode/issues/295
(setq anaconda-mode-localhost-address "127.0.0.1")

;; dap mode config
(after! dap-mode
  (setq dap-python-debugger 'debugpy))

;;; Trigger completion immediately.
(setq company-echo-delay 0)
;; Number the candidates (use M-1, M-2 etc to select completions).
(setq company-show-quick-access t)



;; Settings for lsp-mode (add / overwrite original config)
;; (use-package! lsp-mode
;;   :config
;;   (setq lsp-enable-file-watchers nil)  ;; do not watch files
;;   (setq lsp-idle-delay 0.500)
;;   (setq lsp-ui-doc-position 'top)
;;   (setq lsp-headerline-breadcrumb-segments '(project file symbols))
;;   (setq lsp-ui-imenu-auto-refresh t)
;;   (setq lsp-headerline-breadcrumb-enable t)

;;   ;; Use it only when debugging! It slows down a lsp server a lot.
;;   ;; (setq-default lsp-log-io t)
;;   )
;; Enable breadcrumb
(setq lsp-headerline-breadcrumb-enable t)
(setq lsp-headerline-breadcrumb-segments '(project file symbols))

(setq lsp-ui-doc-show-with-cursor nil)
;; Default is nil. This forces lsp ui to show peek window even when there is only a unique symbol.
(setq lsp-ui-peek-always-show t)


;; Activaete pipenv when projectile starts
(setq pipenv-with-projectile t)
;; Display current project only (https://github.com/Alexander-Miller/treemacs/issues/660)
;; (add-hook 'projectile-after-switch-project-hook 'treemacs-display-current-project-exclusively)  ;; This fails for some reason..

;; (setq lsp-pylsp-configuration-sources '("pycodestyle" "flake8"))
;; (setq lsp-pylsp-configuration-sources '["flake8" "pycodestyle"])
;; (setq lsp-pylsp-plugins-flake8-ignore '(D100 D101 D102 D103 D107))
;; (setq lsp-pylsp-plugins-flake8-ignore 'D103)
;; D100 -
;; (setq lsp-pylsp-plugins-pydocstyle-ignore ["D100" "D101"])

;; activate yascroll
;; This slows down scroll very much!!
;; (global-yascroll-bar-mode 1)

;; (use-package! eldoc-box
;;   :config
;;   (add-hook 'eglot--managed-mode-hook #'eldoc-box-hover-mode t))

;; (add-hook 'python-mode-hook (lambda () (highlight-indent-guides-mode -1)))

;; org-mode config
(use-package! org-journal
  :custom
  (org-journal-dir "~/Synced/google-drive/org/journal")
  (org-journal-file-type 'monthly)  ;; journal weekly
  (org-journal-carryover-items "") ;; Do not carry over last week TODOs
  )

(map! :leader
      (:prefix "n"
        :desc "Journal new entry"           "J" #'org-journal-new-entry
        :desc "Journal open current entry"  "j" #'org-journal-open-current-journal-file))

(setq org-image-actual-width nil)

;; create agenda from all files under ~/Synced/google-drive/org/
(setq org-agenda-files (directory-files-recursively "~/Synced/google-drive/org/" "\\.org$"))

;; leave timestamp when the task is completed
(setq org-log-done 'time)
;; set todo keywords
;; (setq org-todo-keywords
;;   '((sequence "TODO(t)" "SOMEDAY(s)" "WAITING(w)" "|" "DONE(d)" "CANCELED(c@)")))
(setq org-todo-keywords
      '((sequence "TODO(t)" "SOMEDAY(s)" "WAITING(w)" "IDEA(i)" "|" "DONE(d)" "CANCELLED(c)"))
      org-todo-keyword-faces
      '(("SOMEDAY"  . +org-todo-active)
        ("WAITING" . +org-todo-onhold)
        ("CANCELLED" . +org-todo-cancel)))





;; Beautify org mode. This is taken from here (https://zzamboni.org/post/beautifying-org-mode-in-emacs/)
(setq org-hide-emphasis-markers t)
;; (use-package! org-bullets
;;   :config
;;   (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

;; (use-package! writeroom-mode
;;   :config
;;   (add-hook 'writeroom-mode-enable-hook (lambda () (display-line-numbers-mode -1)))
;;   (add-hook 'writeroom-mode-disable-hook (lambda () (display-line-numbers-mode 1))))

;; (custom-theme-set-faces
;;  'user
;;  '(org-block ((t (:inherit fixed-pitch))))
;;  '(org-code ((t (:inherit (shadow fixed-pitch)))))
;;  '(org-document-info ((t (:foreground "dark orange"))))
;;  '(org-document-info-keyword ((t (:inherit (shadow fixed-pitch)))))
;;  '(org-indent ((t (:inherit (org-hide fixed-pitch)))))
;;  ;; '(org-link ((t (:foreground "sky blue" :underline t))))
;;  '(org-meta-line ((t (:inherit (font-lock-comment-face fixed-pitch)))))
;;  '(org-property-value ((t (:inherit fixed-pitch))) t)
;;  '(org-special-keyword ((t (:inherit (font-lock-comment-face fixed-pitch)))))
;;  '(org-table ((t (:inherit fixed-pitch :foreground "#83a598"))))
;;  '(org-tag ((t (:inherit (shadow fixed-pitch) :weight bold :height 0.8))))
;;  '(org-verbatim ((t (:inherit (shadow fixed-pitch))))))

;; (let* ((variable-tuple
;;           (cond ((x-list-fonts "ETBembo")         '(:font "ETBembo"))
;;                 ((x-list-fonts "Source Sans Pro") '(:font "Source Sans Pro"))
;;                 ((x-
;; list-fonts "Lucida Grande")   '(:font "Lucida Grande"))
;;                 ((x-list-fonts "Verdana")         '(:font "Verdana"))
;;                 ((x-family-fonts "Sans Serif")    '(:family "Sans Serif"))
;;                 (nil (warn "Cannot find a Sans Serif Font.  Install Source Sans Pro."))))
;;          (base-font-color     (face-foreground 'default nil 'default))
;;          (headline           `(:inherit default :weight bold :foreground ,base-font-color)))

;;     (custom-theme-set-faces
;;      'user
;;      `(org-level-8 ((t (,@headline ,@variable-tuple))))
;;      `(org-level-7 ((t (,@headline ,@variable-tuple))))
;;      `(org-level-6 ((t (,@headline ,@variable-tuple))))
;;      `(org-level-5 ((t (,@headline ,@variable-tuple))))
;;      `(org-level-4 ((t (,@headline ,@variable-tuple :height 1.1))))
;;      `(org-level-3 ((t (,@headline ,@variable-tuple :height 1.25))))
;;      `(org-level-2 ((t (,@headline ,@variable-tuple :height 1.5))))
;;      `(org-level-1 ((t (,@headline ,@variable-tuple :height 1.75))))
;;      `(org-document-title ((t (,@headline ,@variable-tuple :height 2.0 :underline nil))))))


(use-package! org-download
  :after org
  :defer nil
  :custom
  (org-download-method 'directory)
  (org-download-image-dir "images")
  (org-download-heading-lvl nil)
  (org-download-timestamp "%Y%m%d-%H%M%S_"))
  ;; (org-image-actual-width 300)
  ;; (org-download-screenshot-method "/usr/local/bin/pngpaste %s")
  ;; :bind
  ;; ("C-M-y" . org-download-screenshot)
  ;; :config
  ;; (require 'org-download))

(use-package! deft
  :custom
  (deft-directory "~/Synced/google-drive/org/")
  (deft-recursive t))

(use-package! orb-hide-markers
  :custom
  (setq-default org-babel-hide-markers-line t))

;; magit related
(after! magit
  (map! :leader
        :prefix "g"
        :desc "Show file history" "h" #'magit-log-buffer-file))
(map! :leader
      :prefix "o"
      :desc "Other frame" "t" #'other-frame)

;; window manipulation etc
;; (map! :leader
;;       :prefix "w"
;;       "a" #'ace-window)
;; (setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l))

;; Ace window
(custom-set-faces
 '(aw-leading-char-face
   ((t (:foreground "#e1e143" :height 5.0)))))

;; maimize on startup
;; (add-to-list 'initial-frame-alist '(fullscreen . maximized))


;; Workaround of a known issue of counsel (https://github.com/hlissner/doom-emacs/issues/3038#issuecomment-624165004)
(after! counsel
  (setq counsel-rg-base-command "rg -M 240 --with-filename --no-heading --line-number --color never %s || true"))

;; Workaround of counsel-rg issue (https://github.com/hlissner/doom-emacs/issues/3038#issuecomment-929996064)
;; (defadvice! +ivy--always-return-zero-exit-code-a (fn &rest args)
;;   :around #'counsel-rg
;;   (letf! (defun process-exit-status (_proc)
;;            (let ((code (funcall process-exit-status proc)))
;;              (if (= code 2) 0 code)))
;;     (apply fn args)))

;; SPC-& to search project from current dir.  (<-> SPC-* to search entire project)
(map! :leader "&" '+ivy/project-search-from-cwd)

(after! ivy-posframe
  ;; overwrite default display func
  (setf (alist-get t ivy-posframe-display-functions-alist)
        #'+ivy-display-at-frame-center-near-bottom-fn)
  )

;; (good-scroll-mode 1)
(setq text-scale-mode-step 1.1)

;; load custom functions
;; (load-file "~/.doom.d/custom_funcs.el")

;; (setq-default truncate-lines t)

(setq ispell-dictionary "en_US.multi")

;; Set spell-fu incorrect face
(after! spell-fu
  (set-face-attribute 'spell-fu-incorrect-face nil
                      :underline '(:color "orange" :style wave)))

;; Globally disable writegood mode
(writegood-mode -1)


;; Temporary for model-free project!
;; (setenv "PYTHONPATH" (expand-file-name "~/workspace/model-free_private"))


;; (map! :leader
;;       :desc "Org-timer"
;;       "<f1>" #'+hydra/org-timer/body)

(global-set-key (kbd "<f1>") '+hydra/org-timer/body)

;; writegood-mode
(writegood-passive-voice-turn-off)

(map! "C-s" 'save-buffer)

;; eshell config
;; use (pcomplete-std-complete) for completion (https://emacs.stackexchange.com/a/27871/30129)
(add-hook 'eshell-mode-hook
          (lambda ()
            (define-key eshell-mode-map (kbd "<tab>")
              (lambda () (interactive) (pcomplete-std-complete)))))
;; Whether to scroll to the bottom when a new output comes in.
;; 'other --> enables this only when the window is not selected
(setq eshell-scroll-to-bottom-on-output 'other)

;; ssh-deploy
(use-package! ssh-deploy
  :config
  (ssh-deploy-line-mode)
  (ssh-deploy-add-menu))

;; Configure hl-todo (https://docs.doomemacs.org/latest/modules/ui/hl-todo/)
;; TEMP is in the original value, but doomemacs overwrites (removes) it.
;; (after! hl-todo
;;   (setq hl-todo-keyword-faces
;; 	`(("TEMP" . "#d0bf8f")
;; 	  )))

(add-to-list 'auto-mode-alist '("\\.mdx\\'" . markdown-mode))
