;;; keybindings --- keybinds
;;; Commentary:
;;; Code:
(global-set-key (kbd "C-c C-c") 'comment-region)
(global-set-key (kbd "C-c u") 'uncomment-region)
(global-set-key (kbd "C-c s") 'shell)
(global-set-key (kbd "M-#") 'quick-calc)
(global-set-key (kbd "C-c i") 'indent-region)

;; helm
(require 'helm)
(global-set-key (kbd "C-c b") 'helm-buffers-list)
(global-set-key (kbd "C-c f") 'helm-occur)

;;; Magit
(require 'magit)
(global-set-key (kbd "C-x g") 'magit-status)

(provide 'keybindings)
;;; keybindings.el ends here
