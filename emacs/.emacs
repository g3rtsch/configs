;;; .emacs --- .emcas
;;; Commentary:
;;; File name: ` ~/.emacs '
;;; ---------------------





;; ;; Custom Settings


;;; Code:

;;;;; Broken Tab completion (Cursor jumps to wrong pane
;;;;;
;; (add-to-list 'special-display-buffer-names '("*Completions*" my-display-completions))
;; (defun my-display-completions (buf)
;;   "Put the *completions* buffer BUF in the right spot."
;;   (let ((windows (delete (minibuffer-window) (window-list))))
;;     (if (eq 1 (length windows))
;;         (progn
;;           (select-window (car windows))
;;           (split-window-vertically)))
;;     (let ((target-window (window-at 0 (- (frame-height) 2)))
;;           (pop-up-windows t))
;;       (set-window-buffer target-window buf)
;;      target-window)))


;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(setq initial-buffer-choice t)

(package-initialize)

(add-to-list 'default-frame-alist '(foreground-color . "#E0DFDB"))
(add-to-list 'default-frame-alist '(background-color . "#000000"))
(setq visible-bell 1)

(setq inferior-lisp-program "/usr/bin/sbcl")

(load "~/.emacs.d/init.el")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ediff-split-window-function (quote split-window-horizontally))
 '(gerrit-host "gerrit.ims.co.at")
 '(mu4e-headers-fields
   (quote
    ((:human-date . 12)
     (:flags . 6)
     (:maildir . 20)
     (:from . 22)
     (:subject))))
 '(package-selected-packages
   (quote
    (exec-path-from-shell yaml-mode jedi highlight-indent-guides org-bullets company-ycmd)))
 '(tab-stop-list
   (quote
    (4 8 12 16 20 24 28 32 36 40 44 48 52 56 60 64 68 72 76 80 84 88 92 96 100 104 108 112 116 120))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; myheader
(load "~/.emacs.d/myheader.el")

;; load email mu4e
(load "~/.emacs.d/email.el")

(require 'auto-complete)
(require 'auto-complete-config)
(ac-config-default)
(electric-pair-mode t)

(load "~/.emacs.d/elpa/gerrit-20200110.2130/gerrit.el")

(provide '.emacs)
;;; .emacs ends here
