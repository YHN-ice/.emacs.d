(use-package project
  :ensure nil
  :bind (("C-c p f" . project-find-file)
         ("C-c p r" . project-find-regexp))
  :config
  (defvar project-root-markers '("Cargo.toml" "compile_commands.json" "compile_flags.txt" "CMakeLists.txt")
    "Files or directories that indicate the root of a project.")
  (defun aorst/project-find-root (path)
    "Tail-recursive search in PATH for root markers."
    (let* ((this-dir (file-name-as-directory (file-truename path)))
           (parent-dir (expand-file-name (concat this-dir "../")))
           (system-root-dir (expand-file-name "/")))
      (cond
       ((aorst/project-root-p this-dir) (cons 'transient this-dir))
       ((equal system-root-dir this-dir) nil)
       (t (aorst/project-find-root parent-dir)))))
  (defun aorst/project-root-p (path)
    "Check if current PATH has any of project root markers."
    (let ((results (mapcar (lambda (marker)
                             (file-exists-p (concat path marker)))
                           project-root-markers)))
      (eval `(or ,@ results))))
  (add-to-list 'project-find-functions #'aorst/project-find-root))
(load-theme 'srcery t)
(provide 'init-project)
