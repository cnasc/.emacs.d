(let ((settings '((font . "Fantasque Sans Mono-13")
                  (height . 45)
                  (width . 120))))
  (setq default-frame-alist (nconc settings default-frame-alist)))

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

(use-package better-defaults)

;; TODO: Look up more into the doom theme configuration
(use-package doom-themes
  :init
  (load-theme 'doom-solarized-light t))
