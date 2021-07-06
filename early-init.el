;;; early-init.el --- the very first bits of config  -*- lexical-binding: t; -*-

;; default threshold is 800,000 (~800 kB). I have way more RAM than
;; that, so let's perform fewer collections of greater amounts of
;; garbage.
(setq gc-cons-threshold (* gc-cons-threshold 100))

;; log stats -- helpful for tuning gc-cons-threshold
(add-hook 'emacs-startup-hook
          (lambda ()
            (message "Emacs ready in %s with %d garbage collections. (threshold ~%d kB)"
                     (format "%.2f seconds"
                             (float-time
                              (time-subtract after-init-time before-init-time)))
                     gcs-done
		     (/ gc-cons-threshold 1000))))

(provide 'early-init)
;;; early-init.el ends here


