;;; mygerrit.el --- 
;; 
;; Filename: mygerrit.el
;; Description: 
;; Created: Mon Oct 11 10:43:48 2021 (+0200)
;; 
;;; Commentary: 
;; 
;; 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 
;;; Code:

(require 'gerrit)
(setq  gerrit-host "gerrit.rnd.ims.co.at")
(progn (add-hook 'magit-status-sections-hook #'gerrit-magit-insert-status t))
(setq gerrit-project-to-local-workspace-alist
      '(
        (("software/tools" "datb") "~/prj/git/tools")
        (("software/dbscripts" "main") "~/prj/git/software/dbscripts")
        (("software/cs-cpu" "version-oka") "~/prj/git/software/cs-cpu")
       ))
;; make the number col a bit smaller
(aset gerrit-dashboard-columns 0 '("Number" 6 t))
(aset gerrit-dashboard-columns 2 '("Status" 6 t))
(aset gerrit-dashboard-columns 3 '("Owner" 15 t))
(aset gerrit-dashboard-columns 6 '("Branch" 15 t))
(aset gerrit-dashboard-columns 7 '("Topic" 30 t))
(aset gerrit-dashboard-columns 8 '("Updated" 8 t))


;; helper functions
(defun gerrit-dashboard--reset ()
  "Reset dashboard."
  (interactive)
  (setq gerrit-dashboard-query-alist
        '(("Assigned to me" . "assignee:self (-is:wip OR owner:self OR assignee:self) is:open -is:ignored")
          ("Work in progress" . "is:open owner:self is:wip")
          ("Outgoing reviews" . "is:open owner:self -is:wip -is:ignored")
          ("Incoming reviews" .  "is:open -owner:self -is:wip -is:ignored (reviewer:self OR assignee:self)")
          ("CCed On" . "is:open -is:ignored cc:self")
          ("Recently closed" . "is:closed -is:ignored (-is:wip OR owner:self) (owner:self OR reviewer:self OR assignee:self OR cc:self) limit:15")))
  (setq tabulated-list-sort-key nil)
  (gerrit-dashboard--refresh))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; mygerrit.el ends here
