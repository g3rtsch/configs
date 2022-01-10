;;; keybindings --- keybinds
;;; Commentary:
;;; Code:
;; (global-set-key (kbd "C-c C-c") 'comment-region)
;; (global-set-key (kbd "C-c u") 'uncomment-region)
(global-set-key (kbd "C-c s") 'shell)
(global-set-key (kbd "M-#") 'quick-calc)
(global-set-key (kbd "C-c i") 'indent-region)
(global-set-key (kbd "<f8>") 'conf-mode)
(global-set-key (kbd "<f7>") 'set-frame-name)
(global-set-key (kbd "<f6>") 'whitespace-cleanup)
(global-set-key (kbd "C-c h") 'winner-undo)
(global-set-key (kbd "C-c l") 'winner-redo)
(global-set-key (kbd "C-c d") 'ediff-buffers)
(global-set-key (kbd "<f9>") 'treemacs)
(global-set-key (kbd "C-c -") 'hs-toggle-hiding)

;; remap keys
(define-key global-map [remap list-buffers] 'ibuffer-other-window)

;; helm
;; (require 'helm)
;; (global-set-key (kbd "C-c b") 'helm-buffers-list)
;; (global-set-key (kbd "C-c f") 'helm-occur)

;;; Magit
(require 'magit)
(global-set-key (kbd "C-x g") 'magit-status)

(provide 'keybindings)
;;; keybindings.el ends here
