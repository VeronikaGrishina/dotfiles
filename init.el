;; some startup settings
(global-visual-line-mode t)
(electric-pair-mode t)
(setq initial-buffer-choice "/home/$USER/Documents/Notes/Org")
(find-file "/home/$USER/.config/emacs")

;; org links
(setq org-id-link-consider-parent-id t)

;; install packages
(setq use-package-always-ensure t) ;; can be disabled for a single package by adding :ensure nil to its declaration. 

;; (use-package f)
;; (use-package ht)
(use-package doom-themes
:vc (:url "https://github.com/doomemacs/themes" :rev :newest))
(use-package org
  :vc (:url "https://git.savannah.gnu.org/cgit/emacs/org-mode.git" :rev :newest)
  :config
  (setq org-tags-exclude-from-inheritance (quote ("crypt")))
  (setq org-adapt-indentation t
	org-hide-leading-stars t))
;; (use-package org-superstar
;;   :vc (:url "https://github.com/integral-dw/org-superstar-mode")
;;     :config
;;     ;; org-superstar slowdown workarounds
;;     (setq inhibit-compacting-font-caches t)
;;     (defun my-auto-lightweight-mode ()
;;       "Start Org Superstar differently depending on the number of lists items."
;;       (let ((list-items
;;              (count-matches "^[ \t]*?\\([+-]\\|[ \t]\\*\\)"
;;                             (point-min) (point-max))))
;; 	(unless (< list-items 100)
;; 	  (org-superstar-toggle-lightweight-lists)))
;;       (org-superstar))
    
;;     (add-hook 'org-mode-hook #'my-auto-lightweight-mode)
    
;;     ;; enable org-superstar when org-mode starts
;;     (add-hook 'org-mode-hook (lambda () (org-superstar-mode 1)))
;;     )
(use-package helm 
  ;; :vc (:url "https://github.com/emacs-helm/helm") ;; cannot be installed via package-vc
  :config (require 'helm-autoloads)
  :bind
  ("M-s" . helm-M-x))
(use-package org-crypt
  :config
  (org-crypt-use-before-save-magic)
  (setq org-crypt-key nil))
(use-package org-journal
  :vc (:url "https://github.com/bastibe/org-journal")
  :bind
  ("C-c C-S" . org-journal-search)
  ("C-c C-F" . org-journal-open-next-entry)
  ("C-c C-B" . org-journal-open-previous-entry)
  ("C-c C-J" . org-journal-new-entry)
  ;; (keymap-unset org-journal-search "C-c C-s" 'remove)
  ;; (keymap-unset org-journal-open-next-entry "C-c C-f" 'remove)
  :config
  (setq org-journal-dir "~/Documents/Notes/Org/")
  (setq org-journal-encrypt-journal t)
  (setq org-journal-file-type 'yearly)
  (setq org-journal-carryover-items '""))
  ;; (unbind-key "C-c C-b" org-journal-open-previous-entry)
;; (unbind-key "C-c C-j" org-journal-new-entry))
(use-package company
  :vc (:url "https://github.com/company-mode/company-mode" :rev :newest))
;; (use-package f
;;   :vc (:url "https://github.com/rejeep/f.el" :branch v0.20.0))
;; (use-package ht
;;   :vc (:url "https://github.com/Wilfred/ht.el" :branch 2.3))  
(use-package lsp-mode
  :vc (:url "https://github.com/emacs-lsp/lsp-mode")
  :requires f)
(use-package rust-mode
      :vc (:url "https://github.com/rust-lang/rust-mode"))
;; (use-package rustic)
  ;; :vc (:url "https://github.com/emacs-rustic/rustic"))
(use-package yasnippet
  :vc (:url "https://github.com/joaotavora/yasnippet")
  :config
  (yas-reload-all)
  (add-hook 'company-mode-hook 'yas-minor-mode))
(use-package yasnippet-snippets
  :vc (:url "https://github.com/AndreaCrotti/yasnippet-snippets"))
(use-package habitica
  :vc (:url "https://github.com/mint-marigold/emacs-habitica" :rev :newest))
(use-package kanban
  :load-path "/home/veronika/.config/emacs/elpa/kanban/"
;; :vc (:url "https://hg.sr.ht/~arnebab/kanban.el")
  :config (require 'org-element))

;; previously installed: flycheck-nimsuggest, nim-mode, ob-nim

(org-babel-do-load-languages
  'org-babel-load-languages
  '((emacs-lisp . t) (org . t)
    (shell . t)))



;; set theme
;; (add-hook 'after-init-hook (lambda () (load-theme 'doom-monokai-spectrum)))
