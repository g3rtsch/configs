;;; myheader.el --- myheader
;;; Commentary:
;;; Code:

(add-to-list 'load-path "~/.emacs.d/myloads/header2/")
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

(defsubst header-python ()
  "Insert python shebang."
  (insert "#!/usr/bin/env python" "\n"))

(defsubst auto-make-python-header ()
  "Make header for python files."
  (setq make-header-hook '(header-python
			   header-file-name
			   header-creation-date
			   header-author))
  (auto-make-header))

(defsubst header-md ()
  "Insert Readme template."
  (insert-buffer-substring
   (find-file-noselect "~/prj/git/cube/GUIDE-README-TEMPLATE.md")))

(defsubst auto-make-md-header ()
  "Make header for markdown files."
  (setq make-header-hook '(header-md))
  (auto-make-header))

(autoload 'auto-make-header "header2")
(add-hook 'emacs-lisp-mode-hook 'auto-make-elisp-header)
(add-hook 'sh-mode-hook 'auto-make-shell-header)
(add-hook 'python-mode-hook 'auto-make-python-header)
(add-hook 'markdown-mode-hook 'auto-make-md-header)

(provide 'myheader)
;;; myheader.el ends here
