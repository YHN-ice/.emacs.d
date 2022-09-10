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

(use-package lsp-mode
  :hook ((c++-mode c-mode python-mode java-mode) . lsp-deferred)
  :commands lsp)


(provide 'init-lsp-mode)
;;; init-lsp-mode.el ends here
