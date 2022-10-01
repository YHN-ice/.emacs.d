;;; init-local.el Haoning's customization on top of Purcell's config

(when *is-a-mac*(setq mac-command-modifier 'super)
      (setq mac-option-modifier 'meta))

(require 'init-use-package)
;; (require 'init-lsp-mode)
;; (require 'init-dap-mode)
(require 'init-auctex)
;;;(when *is-a-mac*
;;;  (setq mac-option-modifier 'meta
;;;        mac-command-modifier 'super))
;;;
;;;
;;; (global-set-key (kbd "s-a") 'mark-whole-buffer)
;;; (global-set-key (kbd "s-c") 'kill-ring-save)
;;; (global-set-key (kbd "s-s") 'save-buffer)
;;; (global-set-key (kbd "s-v") 'yank)
;;; (global-set-key (kbd "s-z") 'undo)
;;; (global-set-key (kbd "s-x") 'kill-region)
;;;


;; (defun company-rather-than-corfu ()
;;   (if (equal major-mode 'text-mode)
;;       (and (company-mode nil)
;;            (corfu-mode -1))
;;     )
;;   )

;; TODO: make 'company-rather-than-corfu be called after hooks of 'after-change-major-mode-hook is run
;; (add-hook 'after-change-major-mode-hook #'company-rather-than-corfu)

(require 'init-project)
;; (debug-on-entry 'company-mode-on)
;; (debug-on-entry 'company-mode)
;; (debug-on-entry 'company-mode-set-explicitly)
;; (setq company-global-modes '(not org-mode))

;; (defun jpk/org-mode-hook ()
;;   (company-mode -1))
;; (add-hook 'org-mode-hook #'jpk/org-mode-hook)
(setq-default cursor-type 'bar)

(require 'init-cape)
(provide 'init-local)
