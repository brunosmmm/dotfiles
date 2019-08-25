(setq shell-file-name "/bin/bash")
(setq explicit-shell-file-name "/bin/bash")
(setq org-journal-dir "/home/bruno/work/org/journal")

;; enable fill ruler
(spacemacs/add-to-hooks 'spacemacs/toggle-fill-column-indicator-on
                        '(python-mode-hook c-mode-hook)
                        '(c-mode-hook))

(setq auto-mode-alist (cons '("\\.sc\\'" . c-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.sx\\'" . c-mode) auto-mode-alist))

;; enable key chords in latex mode
(spacemacs/add-to-hooks 'spacemacs/insert-latex-keychords
                        '(latex-mode-hook))

(setq-default dotspacemacs-configuration-layers
              '((auto-completion :variables
                                 auto-completion-enable-help-tooltip t)))

(setq-default dotspacemacs-configuration-layers
              '((auto-completion :variables
                                 auto-completion-enable-sort-by-usage t)))

;; (add-hook 'python-mode-hook 'jedi:setup)
;; (add-hook 'jedi-mode-hook 'jedi-direx:setup)

