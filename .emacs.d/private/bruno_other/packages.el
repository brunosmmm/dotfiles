;;; packages.el --- bruno_other layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2016 Sylvain Benner & Contributors
;;
;; Author:  <bruno@bruno-XPS>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;; See the Spacemacs documentation and FAQs for instructions on how to implement
;; a new layer:
;;
;;   SPC h SPC layers RET
;;
;;
;; Briefly, each package to be installed or configured by this layer should be
;; added to `bruno_other-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `bruno_other/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `bruno_other/pre-init-PACKAGE' and/or
;;   `bruno_other/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst bruno_other-packages
  '(kivy-mode
    (kivy-mode :location elpa)

    ;;flycheck-verilator
    ;;(flycheck-verilator :location local)
    docker-tramp
    (docker-tramp :location local)
    org-journal
    (org-journal :location (recipe :fetcher github :repo "bastibe/org-journal"))
    nlinum
    (nlinum :location elpa)
    sc-mode
    (sc-mode :location (recipe :fetcher github :repo "brunosmmm/sc-mode"))
    textx-mode
    (textx-mode :location (recipe :fetcher github :repo "novakboskov/textx-mode")))
  "The list of Lisp packages required by the bruno_other layer.

Each entry is either:

1. A symbol, which is interpreted as a package to be installed, or

2. A list of the form (PACKAGE KEYS...), where PACKAGE is the
    name of the package to be installed or loaded, and KEYS are
    any number of keyword-value-pairs.

    The following keys are accepted:

    - :excluded (t or nil): Prevent the package from being loaded
      if value is non-nil

    - :location: Specify a custom installation location.
      The following values are legal:

      - The symbol `elpa' (default) means PACKAGE will be
        installed using the Emacs package manager.

      - The symbol `local' directs Spacemacs to load the file at
        `./local/PACKAGE/PACKAGE.el'

      - A list beginning with the symbol `recipe' is a melpa
        recipe.  See: https://github.com/milkypostman/melpa#recipe-format")

(defun bruno_other/init-kivy-mode ()
  (use-package kivy-mode))

;;(defun bruno_other/init-flycheck-verilator ()
;;  (use-package flycheck-verilator))
(defun bruno_other/init-docker-tramp ()
  (use-package docker-tramp))

(defun bruno_other/init-org-journal ()
  (use-package org-journal))

(defun bruno_other/init-nlinum ()
  (use-package nlinum))

(defun bruno_other/init-sc-mode ()
  (use-package sc-mode))

(defun bruno_other/init-textx-mode ()
  (use-package textx-mode))


;;; packages.el ends here
