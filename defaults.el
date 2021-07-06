;;; defaults.el --- basic emacs-native config settings  -*- lexical-binding: t; -*-

;; TODO: make my own awesome startup screen
(setq inhibit-startup-screen t)

;; I wonder if there's a better way to do this
(let ((settings '((font . "Fantasque Sans Mono-13")
                  (height . 45)
                  (width . 120))))
  (setq default-frame-alist (nconc settings default-frame-alist)))

;; ergonomics
(global-hl-line-mode t)
(global-display-line-numbers-mode t)
(show-paren-mode t)

;; annoyances
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(setq visible-bell t)
(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))

(provide 'defaults)
;;; defaults.el ends here
