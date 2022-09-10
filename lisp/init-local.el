;;; init-local.el Haoning's customization on top of Purcell's config

(when *is-a-mac*(setq mac-command-modifier 'super)
      (setq mac-option-modifier 'meta))

(require 'init-use-package)
(require 'init-lsp-mode)
(require 'init-dap-mode)
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

(provide 'init-local)
