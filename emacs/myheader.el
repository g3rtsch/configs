;;; myheader.el --- myheader
;;; Commentary:
;;; Code:

(load-relative "header2.el")
(require 'header2)

(defsubst my/header-mode-line ()
  "Insert !/bin/bash"
  (insert header-prefix-string "!/bin/bash\n"))

(setq make-header-hook '(header-shell
			 header-creation-date
			 header-author))

(add-hook 'sh-mode-hook 'auto-make-header)

(provide 'myheader)
;;; myheader.el ends here
