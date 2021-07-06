;;; init.el --- My startup file                      -*- lexical-binding: t; -*-

;; keep customize settings from polluting main init file
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)
;; various emacs-native config options
(load "~/.emacs.d/defaults.el")
;; some ugly scaffolding moved to its own file
(load "~/.emacs.d/straight-setup.el")

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

(use-package markdown-mode)

(provide 'init)
;;; init.el ends here
