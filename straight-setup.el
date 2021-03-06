;;; straight-setup.el --- configuring straight.el and package stuff  -*- lexical-binding: t; -*-

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

(provide 'straight-setup)
;;; straight-setup.el ends here
