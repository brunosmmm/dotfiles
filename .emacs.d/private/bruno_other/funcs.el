
(defun spacemacs/insert-latex-keychords ()
  "Insert keychord combinations"
  (progn
    (key-chord-mode 1)
    (key-chord-define-local "xb" 'latex/font-bold)
    (key-chord-define-local "xe" 'latex/font-emphasis)
    (key-chord-define-local "xc" 'latex/font-code)))
