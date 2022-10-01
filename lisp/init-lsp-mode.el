;;; Code:

;; For Emacs >= 27


(use-package lsp-ui
  :commands lsp-ui-mode
  :config
  (setq lsp-ui-doc-enable nil)
  (setq lsp-ui-doc-header t)
  (setq lsp-ui-doc-include-signature t)
  (setq lsp-ui-doc-border (face-foreground 'default))
  (setq lsp-ui-sideline-show-code-actions t)
  (setq lsp-ui-sideline-delay 0.05))

(with-eval-after-load 'lsp-mode
  (use-package lsp-mode
    :hook ((c++-mode c-mode python-mode java-mode) .  'lsp-deferred)
    :commands lsp))

;;; REF:
;;; https://www.reddit.com/r/emacs/comments/ql8cyp/comment/hj2k2lh/?utm_source=share&utm_medium=web2x&context=3
(defun corfu-lsp-setup ()
  (setq-local completion-styles '(orderless)
              completion-category-defaults nil)
  (company-mode -1)
  )
(add-hook 'lsp-completion-mode-hook #'corfu-lsp-setup)
;;; END REF

(provide 'init-lsp-mode)
;;; init-lsp-mode.el ends here
