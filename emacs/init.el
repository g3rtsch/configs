;;; init.el --- init
;;; Commentary:
;;; Code:

(load-theme 'wombat)

(require 'package)

(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize)

;;; Python
;; Elpy
(elpy-enable)

;; Ipython
(setq python-shell-interpreter "ipython"
      python-shell-interpreter-args "-i --simple-prompt")


;; higlight line numbers
(load-file "~/.emacs.d/linum-highligth-current-line-number.el")

;; (load-file "~/.emacs.d/elpa/load-relative-20190601.1221/load-relative.el")
(require 'load-relative)


;; Evil
;; (add-to-list 'load-path "~/.emacs.d/elpa/evil-20160827.1510")
;; (require 'evil)
;; (evil-mode t)
;; (setcdr evil-insert-state-map nil)
;; (define-key evil-insert-state-map [escape] 'evil-normal-state)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Flycheck
(add-hook 'after-init-hook #'global-flycheck-mode)


(load-relative "looknfeel.el")
(load-relative "keybindings.el")
(load-relative "themes/wombat-customized.el")
;; (load-relative "header2.el")


;; auto-header
;; (autoload 'auto-update-file-header "header2")
;; (autoload 'auto-make-header "header2")
;; (add-hook 'emacs-lisp-mode-hook 'auto-make-header)
;; (remove-hook 'tex-mode-hook #'turn-on-auto-fill)

;; Buffer Completions

;; (add-to-list 'special-display-buffer-names '("*Completions*" my-display-completions))

;; (defun my-display-completions (buf)
;;   "put the *completions* buffer in the right spot"
;;   (let ((windows (delete (minibuffer-window) (window-list))))
;;     (if (eq 1 (length windows))
;;         (progn
;;           (select-window (car windows))
;;           (split-window-vertically)))
;;     (let ((target-window (window-at 0 (- (frame-height) 2)))
;;           (pop-up-windows t))
;;       (set-window-buffer target-window buf)
;;       target-window)))


;; jedi
;; (add-hook 'python-mode-hook 'jedi:setup)
;; (setq jedi:complete-on-dot t)

;; highlight-indentation
(add-hook 'python-mode-hook 'highlight-indentation-mode)


;; C/C++ IDE
;; ycmd
;; (load-relative "cpp.el")

;; jira-rest
;; (load-relative "~/prj/jira/api/jira-rest/jira-rest.el")
;; (require 'jira-rest)

;; add org-bullets
(require 'org-bullets)
(add-hook 'org-mode-hook 'org-bullets-mode)

;; yaml-mode
(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml\\'" . yaml-mode))

(add-hook 'yaml-mode-hook
  '(lambda ()
     (define-key yaml-mode-map "\C-m" 'newline-and-indent)))

;; add ssh-agent from shells environment varibles
(require 'exec-path-from-shell)
(exec-path-from-shell-copy-env "SSH_AGENT_PID")
(exec-path-from-shell-copy-env "SSH_AUTH_SOCK")


(provide 'init)
;;; init.el ends here
