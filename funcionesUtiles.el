 ;; Primero, eliminamos el paquete si está instalado
  (let ((pkg-desc (cadr (assoc 'haskell-mode package-alist))))
     (when pkg-desc
      (package-delete pkg-desc t)))  ; El argumento t fuerza la eliminación sin preguntar

  ;; Luego, instalamos el paquete
  (package-install 'haskell-mode)
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((haskell . t)))

  (defun replace-results-line ()
  "Reemplaza '#+RESULTS:' por '*RESULTS:*' en el buffer actual."
  (interactive)
  (save-excursion
    (goto-char (point-min))
    (while (search-forward "#+RESULTS:" nil t)
      (replace-match "*RESULTS:*" nil nil))))
