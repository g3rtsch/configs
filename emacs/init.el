;;; init.el --- init
;;; Commentary:
;;; Code:

(load-theme 'wombat)

(require 'package)
(require 'use-package)
;; uncomment to auto install missing packages
;; (setq use-package-always-ensure t)

(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))

(package-initialize)

;; add load-path
(add-to-list 'load-path "~/.emacs.d/elpa/")

;;; Python
;; Elpy
(elpy-enable)

;; Ipython
(setq python-shell-interpreter "ipython3"
      python-shell-interpreter-args "-i --simple-prompt")


;; relative line numbers
(require 'linum-relative)
(linum-relative-on)

;; higlight line numbers
;;(load-file "~/.emacs.d/linum-highligth-current-line-number.el")

;; (load-file "~/.emacs.d/elpa/load-relative-20190601.1221/load-relative.el")
(require 'load-relative)

;; Magit
(setq git-commit-summary-max-length 50)

;; Evil
;; (add-to-list 'load-path "~/.emacs.d/elpa/evil-20160827.1510")
;; (require 'evil)
;; (evil-mode t)
;; (setcdr evil-insert-state-map nil)
;; (define-key evil-insert-state-map [escape] 'evil-normal-state)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Flycheck
(add-hook 'after-init-hook #'global-flycheck-mode)

;; shellcheck
(add-hook 'sh-mode-hook 'flymake-shellcheck-load)

(load-relative "looknfeel.el")
(load-relative "keybindings.el")
(load-relative "myivy.el")
;; (load-relative "themes/wombat-customized.el")

;; myheader
(load "~/.emacs.d/myheader.el")

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
(add-hook 'python-mode-hook 'highlight-indentation-current-column-mode)
(add-hook 'yaml-mode-hook 'highlight-indentation-mode)
(add-hook 'yaml-mode-hook 'highlight-indentation-current-column-mode)
(add-hook 'nxml-mode-hook 'highlight-indentation-mode)
(add-hook 'nxml-mode-hook 'highlight-indentation-current-column-mode)

;; hs-minor-mode (hide/show code definitions/classes)
(add-hook 'python-mode-hook 'hs-minor-mode)

;; python
(add-hook 'python-mode-hook (lambda () (auto-complete-mode -1)))

;; C/C++ IDE
;; ycmd
;; (load-relative "cpp.el")

;; jira-rest
;; (load-relative "~/prj/jira/api/jira-rest/jira-rest.el")
;; (require 'jira-rest)

;; org
;; org autocomplete
(require 'org-ac)
(org-ac/config-default)
;; add org-bullets
(require 'org-bullets)
(add-hook 'org-mode-hook 'org-bullets-mode)

;; flyspell-mode
;; (dolist (hook '(org-mode-hook mu4e-compose-mode-hook))
(dolist (hook '(org-mode-hook mu4e-compose-mode-hook text-mode-hook))
  (add-hook hook (lambda () (flyspell-mode 1))))
;; deactivate flyspell-mode
(dolist (hook '(yaml-mode-hook))
  (add-hook hook (lambda () (flyspell-mode -1))))

;; yaml-mode
(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml\\'" . yaml-mode))

;; ansible minor
(require 'ansible)
(add-hook 'yaml-mode-hook '(lambda () (ansible 1)))

;; add ssh-agent from shells environment varibles
(require 'exec-path-from-shell)
(exec-path-from-shell-copy-env "SSH_AGENT_PID")
(exec-path-from-shell-copy-env "SSH_AUTH_SOCK")

;; load gerrit config
(load-relative "mygerrit.el")

;; display shell buffer at bottom
;; (add-to-list 'display-buffer-alist
;;              '("^\\*shell\\*" . (display-buffer-at-bottom . nil)))

;; Set binary for markdownlint
(setq flycheck-markdown-mdl-executable "~/.local/share/gem/ruby/3.0.0/bin/mdl")
;; disable rules
(setq flycheck-markdown-mdl-rules '("~MD013"
                                    "~MD009"))

;; Set markdown to gfm-mode
(autoload 'gfm-mode "markdown-mode"
   "Major mode for editing GitHub Flavored Markdown files" t)
(add-to-list 'auto-mode-alist '("README\\.md\\'" . gfm-mode))
(add-to-list 'auto-mode-alist '("network\\.md\\'" . gfm-mode))

(provide 'init)
;;; init.el ends here
