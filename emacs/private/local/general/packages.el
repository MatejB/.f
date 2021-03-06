;;; packages.el --- PHP Layer packages File for Spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

(setq general-packages
      '(

        yasnippet
        (yasnippet :location elpa)

        (goto-last-change
         :fetcher url
         :url "https://www.emacswiki.org/emacs/download/goto-last-change.el")

        (multiple-cursors)

        ;;(cursor-chg)

        (expand-region
         :fetcher github
         :repo "magnars/expand-region.el")

        ;; (aggressive-indent)

        (ws-butler
         :fetcher url
         :url "https://raw.githubusercontent.com/lewang/ws-butler/master/ws-butler.el")

        ;; elfeed
        ;; (elfeed :location elpa)

        midnight
        (midnight :location elpa)

        restclient
        (restclient :location elpa)

        ereader
        (ereader :location elpa)

        helm-tramp
        (helm-tramp :location elpa)

        terraform-mode
        (terraform-mode :location elpa)

        company-terraform
        (company-terraform :location elpa)

        org-projectile
        (org-projectile :location elpa)

        ag
        (ag :location elpa)

        (aweshell :location (recipe :fetcher github :repo "manateelazycat/aweshell"))

        ;; exclude list

        ;; (flyspell :excluded t)

        ))

(defun general/post-init-yasnippet ()
  (when (configuration-layer/package-usedp 'yasnippet)
    (global-set-key (kbd "M-đ") 'yas-expand)
    )
  )

(defun general/post-init-org-projectile ()
  (use-package org-projectile
      :bind ("C-c n p" . org-projectile-project-todo-completing-read)
      :config
      (org-projectile-single-file)
      (progn
        (setq org-projectile-projects-file "~/Dropbox/emacs/org/agenda/work.org")
        ; (setq org-agenda-files (append org-agenda-files (org-projectile-todo-files)))
        (push (org-projectile-project-todo-entry) org-capture-templates))

      (push '("t" "Todo" entry (file+headline "~/Dropbox/emacs/org/agenda/todo.org" "Ostalo")
              "* TODO %?\n CREATED: %U\n  %i") org-capture-templates)
      (push '("P" "Personal project" entry (file+headline "~/Dropbox/emacs/org/agenda/projects.org" "my own tools/libs")
              "* TODO %?\n CREATED: %U\n  %i") org-capture-templates)

      :ensure t))

(defun general/init-goto-last-change ()
  (use-package goto-last-change
    :defer t
    :init
    (define-key global-map "\C-c\C-v" 'goto-last-change)
    :config))

(defun general/init-multiple-cursors ()
  (use-package multiple-cursors
    :defer t
    :init
    (global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
    (global-set-key (kbd "C->") 'mc/mark-next-like-this)
    (global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
    (global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)
    (global-set-key (kbd "C-S-<mouse-1>") 'mc/add-cursor-on-click)
    :config))

;; (defun general/init-cursor-chg ()
;;   (use-package cursor-chg
;;     :defer t
;;     :init
;;     (curchg-toggle-cursor-type-when-idle 1) ; Turn on cursor change when Emacs is idle
;;     (curchg-change-cursor-mode 1) ; Turn on change for overwrite, read-only, and input mode
;;     :config))

(defun general/init-expand-region ()
  (use-package expand-region
    :defer t))

(defun general/init-ws-butler ()
  (use-package ws-butler
    :defer t
    :init
    (ws-butler-mode 1)))

;; (defun general/init-elfeed ()
;;   (use-package elfeed-search
;;     :defer t
;;     :init
;;     ;; code
;;     :config
;;     (define-key elfeed-search-mode-map (kbd "RET") 'elfeed-search-show-entry-new-window)
;;     (define-key elfeed-show-mode-map "q" 'elfeed-show-exit)
;;     ))

(defun general/init-midnight ()
  (use-package midnight
    :defer t
    :init
    ;; code
    :config
    (setq clean-buffer-list-delay-general 1)
    (setq midnight-period 7200) ;; (eq (* 2 60 60) "2 hours")
    ))

(defun general/init-restclient ()
  (use-package restclient
    :defer t
    :init))

(defun general/init-ereader ()
  (use-package ereader
    :defer t
    :init))

(defun general/init-helm-tramp ()
  (use-package helm-tramp
    :defer t
    :init
    (global-set-key (kbd "M-m a h") 'helm-tramp)
    ))


(defun general/init-company-terraform ()
  (use-package company-terraform
    :defer t
    :init
    ))

(defun general/init-terraform-mode ()
  (use-package terraform-mode
    :defer t
    :init
    ))

(defun general/init-ag ()
  (use-package ag
    :defer t
    :init
    ))

(defun general/init-aweshell ()
  (use-package aweshell
    :init
    :bind (("M-s" . aweshell-new)
           ("M-n" . aweshell-next)
           ("M-p" . aweshell-prev)
           ("C-c M-s" . aweshell-sudo-toggle-key)
           ("C-c C-r" . aweshell-search-history-key))
    ))

;; (defun general/init-golden-ratio ()
;;   (use-package golden-ratio
;;     :defer t
;;     :init))

;; (defun general/init-aggressive-indent ()
;;   (use-package aggressive-indent
;;     :defer t
;;     :init
;;     (global-aggressive-indent-mode 1)
;;     :config))

