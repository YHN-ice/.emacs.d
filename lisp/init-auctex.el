;;; (add-to-list 'load-path  "/Users/xiehaoning/.emacs.d/elpa-28.1/auctex-13.1.4" )
(load "auctex.el" nil t t)
(load "preview.el" nil t t)
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)
(setq TeX-PDF-mode t)

;; ;; xelatex编译配置
;; (add-hook 'LaTeX-mode-hook
;;           (lambda()
;;             (add-to-list 'TeX-command-list '("XeLaTeX" "%`xelatex%(mode)%' %t" TeX-run-TeX nil t))
;;             (setq TeX-command-default "XeLaTeX")
;;             (setq TeX-save-query nil)
;;             (setq TeX-show-compilation t)
;;             ))


(setq TeX-view-program-list
      '(("PDF Viewer" "/Applications/Skim.app/Contents/SharedSupport/displayline -b -g %n %o %b")))

(eval-after-load 'tex
  '(progn
     (assq-delete-all 'output-pdf TeX-view-program-selection)
     (add-to-list 'TeX-view-program-selection '(output-pdf "PDF Viewer"))))

(add-hook 'LaTeX-mode-hook
          #'(lambda ()
              (add-to-list 'TeX-command-list '("pdfLaTeX" "%`pdflatex -synctex=1%(mode)%' %t" TeX-run-TeX nil t))
              (add-to-list 'TeX-command-list '("XeLaTeX" "%`xelatex -synctex=1%(mode)%' %t" TeX-run-TeX nil t))
              (setq TeX-command-extra-options "-file-line-error -shell-escape")
              (setq TeX-command-default "XeLaTeX")
              (setq TeX-save-query  nil ) ;; 不需要保存即可编译
              (setq TeX-show-compilation nil)
              (magic-latex-buffer 1)
              ))

(custom-set-variables
 '(TeX-source-correlate-method 'synctex)
 '(TeX-source-correlate-mode t)
 '(TeX-source-correlate-start-server t))
(provide 'init-auctex)
