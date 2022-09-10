;;; Code:

;; For Emacs >= 27


(when (maybe-require-package 'dap-mode)
  (with-eval-after-load 'dap-mode


    (use-package dap-mode
      :defer
      :custom
      (dap-auto-configure-mode t                           "Automatically configure dap.")
      (dap-auto-configure-features
       '(sessions locals breakpoints expressions tooltip)  "leave out the button panel in the top.")
      :config
  ;;; dap for c++
      (load-library "dap-lldb")
      (load-library "dap-cpptools.elc")

;;; set the debugger executable (c++)
      (setq dap-lldb-debug-program '("/usr/local/opt/llvm/bin/lldb-vscode"))

  ;;; ask user for executable to debug if not specified explicitly (c++)
      (setq dap-lldb-debugged-program-function (lambda () (expand-file-name (read-file-name "Select file to debug."))))

      ;; ;;; default debug template for (c++)
      ;;     (dap-register-debug-template
      ;;      "C++ LLDB dap"
      ;;      (list :type "lldb-vscode"
      ;;            :cwd nil
      ;;            :args nil
      ;;            :request "launch"
      ;;            :program nil))

      (defun dap-debug-create-or-edit-json-template ()
        "Edit the C++ debugging configuration or create + edit if none exists yet."
        (interactive)
        (let ((filename (concat (lsp-workspace-root) "/launch.json"))
              (default "~/.emacs.d/default-launch.json"))
          (unless (file-exists-p filename)
            (copy-file default filename))
          (find-file-existing filename))))
    )
  )





(provide 'init-dap-mode)
;;; init-dap-mode.el ends here
