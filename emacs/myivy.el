;;; myivy.el --- 
;; 
;; Filename: myivy.el
;; Description: 
;; Author: Gerald Pigisch
;; Created: Thu Feb  2 12:25:30 2023 (+0100)
;; 
;;; Commentary: 
;; 
;; 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 
;;; Code:

(require 'ivy)
(require 'counsel)
(ivy-mode t)
;; (counsel-mode t) ;; sets too much and overwrites "C-h b"

(setq ivy-use-virtual-buffers t)
(setq ivy-count-format "(%d/%d) ")

;; (setq ivy-re-builders-alist '((t . ivy--regex-plus)))
(setq ivy-re-builders-alist
      '((read-file-name-internal . regexp-quote)
        (t . ivy--regex-plus)))

;; keybinds
(global-set-key (kbd "M-x") 'counsel-M-x)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; myivy.el ends here
