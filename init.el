(require 'package)

;; run (package-install-selected-packages)
(setq package-selected-packages
      '(vertico
	use-package
	consult
	expand-region
	multiple-cursors
	orderless
	magit
	exec-path-from-shell))

(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))

(load-theme 'leuven)
(tool-bar-mode -1)

(setq mac-option-key-is-meta nil
      mac-command-key-is-meta t
      mac-command-modifier 'meta
      mac-option-modifier 'none
      dired-dwim-target t)

(global-set-key [134217895] 'beginning-of-buffer)
(global-set-key [134217904] 'end-of-buffer)

(eval-when-compile
  (require 'use-package))

(use-package org
  :bind
  (("C-c a" . org-agenda)
   ("C-c c" . org-capture)
   (:map org-mode-map
	 ("C-," . mc/mark-next-like-this)))
  :init
  (setq org-agenda-files '("~/Dropbox/Notes/agenda/"))
  (setq org-capture-templates '(("t" "Todo" entry
                                 (file "~/Dropbox/Notes/agenda/inbox.org")
                                 "* TODO %?\n  SCHEDULED: %t\n%i\n%a")
                                ("k" "Event" entry
                                 (file "~/Dropbox/Notes/agenda/inbox.org")
                                 "* %?\n%t"))))

(use-package expand-region
  :bind
  ("C-." . er/expand-region))

(use-package orderless
  :custom
  (completion-styles '(orderless basic))
  (completion-category-overrides '((file (styles basic partial-completion)))))

(use-package multiple-cursors
  :bind
  ("C-'" . mc-hide-unmatched-lines-mode)
  ("C-," . mc/mark-next-like-this)
  ("C-;" . mc/mark-all-dwim)
  :init
  (setq hum/lines-to-expand 1))

(use-package consult
  :bind
  ("C-c s" . consult-line)
  ("C-c g" . consult-ripgrep))

(use-package vertico
  :init (vertico-mode))

(use-package magit)
