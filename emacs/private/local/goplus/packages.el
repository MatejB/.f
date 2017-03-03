(defconst goplus-packages
  '(

    yasnippet
    (yasnippet :location elpa)

    flycheck-gometalinter
    (flycheck-gometalinter :location elpa)

    gotest
    (gotest :location elpa)

    go-add-tags
    (go-add-tags :location elpa)

    ))

(defun goplus/post-init-yasnippet ()
  (when (configuration-layer/package-usedp 'yasnippet)
    (add-to-list 'yas-snippet-dirs "~/.f/emacs/private/snippets/go-mode")
    )
  )

(defun goplus/init-flycheck-gometalinter ()
  (use-package flycheck-gometalinter
    :post-config

    ;; skips 'vendor' directories and sets GO15VENDOREXPERIMENT=1
    (setq flycheck-gometalinter-vendor t)

    ;; only run fast linters
    (setq flycheck-gometalinter-fast t)

    ;; use in tests files
    (setq flycheck-gometalinter-test t)

    ;; disable linters
    ;;(setq flycheck-gometalinter-disable-linters '("gotype" "gocyclo"))

    ;; Only enable selected linters
    ;; (setq flycheck-gometalinter-disable-all t)
    ;; (setq flycheck-gometalinter-enable-linters '("golint"))

    ;; Set different deadline (default: 5s)
    (setq flycheck-gometalinter-deadline "5s")

    ))

(defun goplus/init-gotest ()
  (use-package gotest
    ))

(defun goplus/init-go-add-tags ()
  (use-package go-add-tags
    ))
