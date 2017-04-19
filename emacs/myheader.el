;;; myheader.el --- myheader
;;; Commentary:
;;; Code:

(load-relative "header2.el")
(require 'header2)

(defsubst auto-make-elisp-header ()
;; (defun auto-make-elisp-header ()
  "Make headers for Lisp files."
  (setq make-header-hook '(header-title
			   header-blank
			   header-file-name
			   header-description
			   header-author
			   header-creation-date
			   header-commentary
			   header-blank
			   header-blank
			   header-end-line
			   header-code
			   header-eof))
  (auto-make-header))

(defsubst auto-make-shell-header ()
;; (defun auto-make-shell-header ()
  "Make headers for shell files."
  (setq make-header-hook '(header-shell
			   header-creation-date
			   header-author))
  (auto-make-header))

(autoload 'auto-make-header "header2")
(add-hook 'emacs-lisp-mode-hook 'auto-make-elisp-header)
(add-hook 'sh-mode-hook 'auto-make-shell-header)


(provide 'myheader)
;;; myheader.el ends here
