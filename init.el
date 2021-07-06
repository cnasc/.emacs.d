;;; init.el --- My startup file                      -*- lexical-binding: t; -*-

;; keep customize settings from polluting main init file
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

(setq inhibit-startup-screen t)
(let ((settings '((font . "Fantasque Sans Mono-13")
                  (height . 45)
                  (width . 120))))
  (setq default-frame-alist (nconc settings default-frame-alist)))

(global-hl-line-mode t)
(global-display-line-numbers-mode t)
(show-paren-mode t)
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; TODO: workaround for failure in setting up straight.el. See
;; https://github.com/raxod502/straight.el/issues/757
(setq native-comp-deferred-compilation-deny-list nil)
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

;; This should be the only instance of straight-use-package
;; Everything else will go through use-package
(straight-use-package 'use-package)
(setq straight-use-package-by-default t)

(use-package rainbow-delimiters
  :hook
  (prog-mode . rainbow-delimiters-mode))

(use-package modus-themes
  :init
  (setq	modus-themes-mode-line '(accented)
	modus-themes-completions 'opinionated
	modus-themes-subtle-line-numbers t
	modus-themes-paren-match 'subtle-bold)
  (modus-themes-load-themes)
  :config
  (modus-themes-load-operandi)
  :bind ("<f5>" . modus-themes-toggle))

(use-package magit
  :bind
  (("C-x g" . magit-status)))

(use-package paredit
  :hook
  ((emacs-lisp-mode) . paredit-mode))

(use-package company
  :config
  (setq company-idle-delay 0.2)
  (setq company-show-numbers t)
  (setq company-dabbrev-downcase 0)
  :hook
  (after-init . global-company-mode))

(use-package crux
  :bind
  (("C-a" . crux-move-beginning-of-line)
   ("C-k" . crux-smart-kill-line)
   ("M-o" . crux-smart-open-line)
   ("C-c I" . crux-find-user-init-file)))

(provide 'init)
;;; init.el ends here
