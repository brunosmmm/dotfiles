;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused
   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t
   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(octave
     rust
     (ivy :variables ivy-enable-advanced-buffer-information t ivy-enable-icons t)
     ;; helm
     ess
     emacs-lisp
     yaml
     shell-scripts
     html
     javascript
     (auto-completion :variables auto-completion-use-company-box t)
     (git :variables git-enable-magit-todos-plugin t)
     github
     (python :variables python-test-runner 'pytest python-backend 'lsp python-formatter 'black python-format-on-save t)
     ipython-notebook
     (c-c++ :variables c-c++-backend 'lsp-ccls c-c++-adopt-subprojects t)
     (latex :variables latex-backend 'lsp)
     bibtex
     markdown
     (org :variables org-enable-github-support t org-projectile-file "/home/bruno/work/org/GlobalTODO.org" org-enable-org-journal-support t org-enable-reveal-js-support t)
     gtags
     cscope
     ;; semantic
     syntax-checking
     (spell-checking :variables spell-checking-enable-by-default nil)
     spotify
     (shell :variables shell-default-term-shell "/usr/bin/fish")
     ibuffer
     docker
     systemd
     ;; HACK temporary regression?
     ;; (lsp :variables lsp-ui-doc-enable nil lsp-signature-auto-activate nil lsp-ui-doc-winum-ignore t lsp-ui-doc--buffer-prefix " *lsp-ui-doc-")
     (lsp :variables lsp-pyls-plugins-jedi-use-pyenv-environment t lsp-signature-auto-activate nil)
     (plantuml :variables plantuml-jar-path "/usr/share/java/plantuml/plantuml.jar" org-plantuml-jar-path "/usr/share/java/plantuml/plantuml.jar")
     (dap :variables dap-ui-locals-expand-depth 2 dap-python-debugger 'debugpy)
     imenu-list
     (cmake :variables cmake-enable-cmake-ide-support t)
     scala
     (deft :variables deft-zetteldeft t)
     slack
     treemacs
     multiple-cursors
     (json :variables json-fmt-on-save t)
     meson
     helpful
     (unicode-fonts :variables unicode-fonts-enable-ligatures t)
   )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '(
                                      ;; (sedona-mode :location
                                      ;;              (recipe :fetcher github :repo "brunosmmm/sedona-mode"))
                                      all-the-icons-dired
                                      bitbake
                                      doom-themes
                                      (textx-mode :location (recipe :fetcher github :repo "novakboskov/textx-mode"))
                                      focus
                                      (lsp-focus :location (recipe :fetcher github :repo "emacs-lsp/lsp-focus"))
                                      ox-hugo
                                      org-caldav
                                      org-ql
                                      highlight-indent-guides
                                      bufler
                                      (nerd-fonts :location (recipe :fetcher github :repo "mohkale/nerd-fonts.el"))
                                      tree-sitter
                                      tree-sitter-langs
                                      dogears
                                      )
   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()
   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '(ensime)
   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and uninstall any
   ;; unused packages as well as their unused dependencies.
   ;; `used-but-keep-unused' installs only the used packages but won't uninstall
   ;; them if they become unused. `all' installs *all* packages supported by
   ;; Spacemacs and never uninstall them. (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5

   ;; Set `gc-cons-threshold' and `gc-cons-percentage' when startup finishes.
   ;; This is an advanced option and should not be changed unless you suspect
   ;; performance issues due to garbage collection operations.
   ;; (default '(100000000 0.1))
   dotspacemacs-gc-cons '(100000000 0.1)

   ;; If non-nil then Spacelpa repository is the primary source to install
   ;; a locked version of packages. If nil then Spacemacs will install the
   ;; latest version of packages from MELPA. (default nil)
   dotspacemacs-use-spacelpa nil

   ;; If non-nil then verify the signature for downloaded Spacelpa archives.
   ;; (default t)
   dotspacemacs-verify-spacelpa-archives t
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil
   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'.
   dotspacemacs-elpa-subdirectory 'emacs-version
   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'vim

   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official
   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'."
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 8)
                                (bookmarks . 8)
                                (projects . 8))
   ;; True if the home buffer should respond to resize events.
   dotspacemacs-startup-buffer-responsive t
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode

   ;; Initial message in the scratch buffer, such as "Welcome to Spacemacs!"
   ;; (default nil)
   dotspacemacs-initial-scratch-message nil

   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(doom-monokai-classic
                         doom-nord-light)
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font '("Iosevka"
                               :size 16
                               :weight normal
                               :width normal
                               :powerline-scale 1.0)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The key used for Emacs commands (M-x) (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"
   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; If non nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ nil
   ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t
   ;; If non-nil, J and K move lines up and down when in visual mode.
   ;; (default nil)
   dotspacemacs-visual-line-move-text nil
   ;; If non nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global nil
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; Controls fuzzy matching in helm. If set to `always', force fuzzy matching
   ;; in all non-asynchronous sources. If set to `source', preserve individual
   ;; source settings. Else, disable fuzzy matching in all sources.
   ;; (default 'always)
   dotspacemacs-helm-use-fuzzy 'always
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-transient-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t
   ;; If non nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; Control line numbers activation.
   ;; If set to `t' or `relative' line numbers are turned on in all `prog-mode' and
   ;; `text-mode' derivatives. If set to `relative', line numbers are relative.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; (default nil)
   dotspacemacs-line-numbers t
   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."
  ;; replace default separator due to weird rendering
  ;; (setq dotspacemacs-mode-line-theme '(all-the-icons :separator slant :separator-scale 1.5))
  (setq dotspacemacs-mode-line-theme '(doom))
  (setq comp-deferred-compilation t)
  (add-hook 'prog-mode-hook 'highlight-indent-guides-mode)
  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."

  (setq dotspacemacs-org-directory "~/work/org/")

  ;;c++: do not indent inside namespaces
  (c-set-offset 'innamespace 0)

  ;; SCons highlighting (Python)
  (add-to-list 'auto-mode-alist '("SConstruct" . python-mode))
  (add-to-list 'auto-mode-alist '("SConscript" . python-mode))

  ;;switch buffers with shift
  (windmove-default-keybindings)

  ;;flycheck force C++11
  (add-hook 'c++-mode-hook (lambda () (setq flycheck-gcc-language-standard "c++11")))
  (add-hook 'c++-mode-hook (lambda () (setq flycheck-clang-language-standard "c++11")))

  ;;enable global ws-butler
  (ws-butler-global-mode 1)

  ;; focus follows mouse
  (setq mouse-autoselect-window t)

  ;; imenu
  (setq imenu-list-auto-resize nil)
  (setq imenu-list-size 0.3)

  ;; my org agenda files
  (setq bmorais/agenda-files
        `(,(concat dotspacemacs-org-directory "personal/agenda.org")
          ,(concat dotspacemacs-org-directory "personal/ideas.org")
          ,(concat dotspacemacs-org-directory "neu/neu-agenda.org")
          ,(concat dotspacemacs-org-directory "neu/esl/4534clock2020.org")
          ,(concat dotspacemacs-org-directory "oneshot.org")
          ,(concat dotspacemacs-org-directory "inbox.org")
          ,(concat dotspacemacs-org-directory "personal/clock.org")))

  ;; org config
  (with-eval-after-load 'org
    (setq org-directory dotspacemacs-org-directory)
    (require 'org-protocol)
    (setq org-journal-enable-agenda-integration t)
    (setq org-journal-dir (concat dotspacemacs-org-directory "journal"))
    (setq org-plantuml-jar-path "/usr/share/java/plantuml/plantuml.jar")
    (org-babel-do-load-languages 'org-babel-load-languages
                                 '((plantuml . t) (shell . t) (R . t) (python . t)))

    (setq org-refile-targets '((bmorais/agenda-files :maxlevel . 2)))
    ;; org capture templates stolen from https://blog.jethro.dev/posts/capturing_inbox/ and modified
    (setq org-capture-templates
          `(("i" "inbox" entry (file ,(concat dotspacemacs-org-directory "inbox.org"))
             "* REFILE %? :uncategorized:")
            ("e" "email" entry (file+headline ,(concat dotspacemacs-org-directory "emails.org") "Emails")
             "* TODO [#A] Reply: %a :@home:@school:" :immediate-finish t)
            ("l" "link" entry (file ,(concat dotspacemacs-org-directory "inbox.org"))
             "* TODO %(org-cliplink-capture)" :immediate-finish t)
            ("c" "org-protocol-capture" entry (file ,(concat dotspacemacs-org-directory "inbox.org"))
             "* TODO [[%:link][%:description]]\n\n %i" :immediate-finish t)
            ("a" "actionable" entry (file ,(concat dotspacemacs-org-directory "oneshot.org"))
             "* TODO %? :actionable:oneshot:")
            ("A" "actionable (immediate)" entry (file ,(concat dotspacemacs-org-directory "oneshot.org"))
             "* NEXT %? :actionable:oneshot:" :clock-in t)
            ("L" "shopping list item")
            ("Lg" "groceries" checkitem (id "a0db56ce-b7af-4c74-b53e-03d3c096fc8c")
             "- [ ] %?")
            ("Lo" "other items" checkitem (id "cdba90be-e668-470a-a4bf-eaca8c11dfd9")
             "- [ ] %?")
            ))
    )

  ;; custom agenda view with my categories
  (with-eval-after-load 'org-agenda
    (setq
     bmorais/org-agenda-todo-view
     `("g" "Agenda"
       (
        ;; day view
        (agenda
         ""
         ((org-agenda-span 'day) (org-deadline-warning-days 365)
          (org-super-agenda-groups
           '(
             ;; time grid
             (:discard (:todo "REFILE")) (:name "Today" :time-grid t :date today :scheduled today)
             ;; critical items
             (:name "Critical / Overdue" :tag "critical" :deadline past :priority "A"
                    :transformer(-->
                                 it (concat it " " (all-the-icons-faicon "exclamation-triangle" :v-adjust 0.1 :height 1.0))))
             ;; requires attention -- limit to 30 days, but priority >= B overrides it
             (:name "Requires attention" :tag "important"
                    :and (:deadline future :deadline (before ,(org-read-date nil nil "+30"))) :priority>= "B")
             ;; discard anything else, will show up in the todo-list
             (:discard (:anything t))
             ))
          ))
        ;; critical item section always visible
        (alltodo
         ""
         ((org-agenda-overriding-header "") (org-agenda-span 1) (org-agenda-compact-blocks t)
          (org-agenda-entry-types '(:deadline :scheduled :timestamp)) (org-deadline-warning-days 7)
          (org-agenda-todo-keyword-format "")
          (org-super-agenda-groups
           '(
             ;; week preview
             (:name "Happening soon" :and (:deadline future :deadline (before ,(org-read-date nil nil "+7")))
                    :scheduled (before ,(org-read-date nil nil "+7")))
             ;; discard anything else, will show up in the todo-list
             (:discard (:anything t))))
          ))
        ;; to-do list, events etc
        (alltodo
         ""
         ((org-agenda-overriding-header "") (org-agenda-files bmorais/agenda-files)
          (org-super-agenda-groups
           '(
             ;; items to be refiled from inbox
             (:name "Inbox -> refile" :file-path "inbox")
             ;; items that are currently in progress
             (:name "In progress" :todo "NEXT")
             ;; WORK tasks
             (:name "Work tasks" :file-path "neu-agenda" :tag ("neu" "eece4534"))
             ;; personal tasks
             ;; dont show WAITING, LONGTERM todo type (long-term)
             (:name "Personal tasks" :and (:file-path "agenda" :not (:todo ("WAITING" "LONGTERM" "NONACTIONABLE"))))
             ;; project tasks
             (:name "Projects" :tag "projects")
             ;; idea development
             (:name "Idea development" :file-path "ideas" :tag "ideas")
             ;; misc items
             (:name "Oneshot and miscellaneous list" :file-path "oneshot")
             ;; get rid of rest
             (:discard (:anything t))
             ))
          ))
        nil)))
    (setq bmorais/org-agenda-family-view
          `("F" "Family agenda"
            (
             (org-ql-block '(and (not (done)) (org-entry-get (point) "family-calendar" 'inherit) (not (property "query-hide" "yes")))
                            ((org-ql-block-header "Family calendar")))
              ))))

  (defun bmorais/call-and-close-buffers (fn keep-buffer-regex &rest fnargs)
    "Call a function which opens many buffers, then close them accordingly."
    (setq buffers-before (buffer-list))
    (setq retval (apply fn fnargs))
    (setq new-buffers (-difference (buffer-list) buffers-before))
    ;; kill buffers
    (dolist (buffer new-buffers)
      (if (not (eq keep-buffer-regex nil))
          (if (eq (string-match keep-buffer-regex (buffer-name buffer)) nil)
              (kill-buffer buffer))))
    retval)

  (defun bmorais/org-ql-view-close-buffers (fn &rest args)
    "Wrap org-ql-view calls and close open buffers."
    (apply 'bmorais/call-and-close-buffers fn "Org QL View" args)
    )

  ;; add org-ql-view wrapper
  ;; NOTE this breaks any functionality provided; if used, buffer can only show information
  ;; (advice-add 'org-ql-view :around #'bmorais/org-ql-view-close-buffers)

  (defun bmorais/show-agenda ()
    "Show agenda as filtered by org-super-agenda as default."
    (interactive)
    (org-agenda nil "g"))

  (defun bmorais/show-ql-soon ()
    "Show org-ql-view."
    (interactive)
    (org-ql-view "Overview: Happening soon"))

  (defun bmorais/show-ql-today ()
    "Show orq-ql-view for today."
    (interactive)
    (org-ql-view "Today's Agenda"))

  (defun bmorais/show-ql-longterm ()
    "Show orq-ql-view for longterm."
    (interactive)
    (org-ql-view "Overview: Longterm"))

  (defun bmorais/show-ql-unsched ()
    "Show unscheduled tasks"
    (interactive)
    (org-ql-view "Unscheduled tasks"))

  (defun bmorais/show-ql-misc ()
    "Show miscellaneous tasks"
    (interactive)
    (org-ql-view "Oneshot tasks"))

  (defun bmorais/show-ql-clocks ()
    "Show project clocks."
    (interactive)
    (org-ql-view "Project clocks"))

  (defun bmorais/show-ql-next ()
    "Show next / current tasks."
    (interactive)
    (org-ql-view "In progress"))

  (defun bmorais/show-ql-todos ()
    "Show all TODOs"
    (interactive)
    (org-ql-view "All TODOs"))

  (defun bmorais/org-ql-hide-from-query ()
    "Hide stuff from orq-ql queries based on existence of property 'query-hide'"
    (not (property "query-hide" "yes")))

  (defun bmorais/all-org-files ()
      "Get all org files that are not archived."
      (directory-files-recursively dotspacemacs-org-directory "^\\(^archived\\)?[^#]+\.org$"))

  (defun bmorais/sync-family-calendar ()
    "Sync family calendar."
    (interactive)
    (require 'org-caldav)
    (require 'org-agenda)
    (setq org-icalendar-timezone "America/New_York")
    (setq family-calendar `(:calendar-id "9142d845-f017-7a47-82a6-5ba8ca897aec" :files ("~/work/org/personal/agenda.org")
                                         :url "https://bmorais39.duckdns.org:88/radicale/morais39"
                                         :select-tags ("familycalendar")
                                         :skip-conditions ('notdeadline 'notscheduled 'todo 'done)
                                         :inbox "~/work/org/inbox.org"
                                         ))
    (setq bruno-ext-calendar `(:calendar-id "fef30a1a-7984-77bb-9aa3-6c87ab033e7e" :files ("~/work/org/personal/agenda.org")
                                         :url "http://bmorais39.duckdns.org:88/radicale/morais39"
                                         :select-tags ("brunoextcalendar")
                                         :skip-conditions ('notdeadline 'notscheduled 'todo 'done)
                                         :inbox "~/work/org/inbox.org"
                                         ))
    (org-caldav-sync-calendar family-calendar)
    (org-caldav-sync-calendar bruno-ext-calendar))

  ;; FIXME workaround for recursive load
  ;; (require 'window-purpose)

  ;; overwrite agenda keybindings
  (spacemacs/set-leader-keys "aoa" 'bmorais/show-agenda)
  ;; set some more agenda-related bindings
  (spacemacs/set-leader-keys "aoqs" 'bmorais/show-ql-soon)
  (spacemacs/set-leader-keys "aoqt" 'bmorais/show-ql-today)
  (spacemacs/set-leader-keys "aoql" 'bmorais/show-ql-longterm)
  (spacemacs/set-leader-keys "aoqS" 'org-ql-search)
  (spacemacs/set-leader-keys "aoqu" 'bmorais/show-ql-unsched)
  (spacemacs/set-leader-keys "aoqm" 'bmorais/show-ql-misc)
  (spacemacs/set-leader-keys "aoqc" 'bmorais/show-ql-clocks)
  (spacemacs/set-leader-keys "aoqn" 'bmorais/show-ql-next)
  (spacemacs/set-leader-keys "aoqT" 'bmorais/show-ql-todos)
  (spacemacs/set-leader-keys "aoqF" 'bmorais/sync-family-calendar)

  ;; setup org-ql views
  (with-eval-after-load 'org-ql
    (setq
     org-ql-views
     '(
       ;; items that are happening soon, scheduled, deadline or timestamps
       ("Overview: Happening soon" :buffers-files org-agenda-files
        :query (and (not (done)) (ts) (planning 7))
        :sort (priority date) :title "Happenning soon"
        :super-groups
        (
         (:name "Overdue tasks" :scheduled past :deadline past :order 1)
         (:name "Tasks scheduled to happen soon" :anything t :order 0)
         ))
       ;; Longterm overview: shows the next 365 days for active timestamps
       ("Overview: Longterm" :buffers-files org-agenda-files
        :query (and (not (done)) (ts-active :from today :to ,(org-read-date nil nil 365))
                    (bmorais/org-ql-hide-from-query))
        :sort (priority date) :title "Longterm view" :super-groups
        ((:name "Work-related tasks and appointments" :and (:file-path "neu-agenda" :todo "TODO")
                :tag ("esl" "eece4534" "neu"))
         (:name "Work-related important dates & events" :file-path "neu-agenda")
         (:name "Personal tasks and appointments" :and (:file-path "agenda" :todo "TODO"))
         (:name "Personal important dates & events" :file-path "agenda"
                :transformer (--> it ))
         ;; discard everything else
         (:discard (:anything t))))
       ;; Today's agenda: what is due today
       ("Today's Agenda" :buffers-files org-agenda-files
        :query (and (or (ts-active :on today) (deadline :to today) (scheduled :to today)) (not (done)))
        :sort (priority)
        :title "Today's Agenda"
        :super-groups ((:name "Due today" :scheduled today :deadline today)
                       (:name "Critical / Overdue" :tag "critical" :deadline past :priority "A")))
       ;; Unscheduled tasks: show all unscheduled tasks
       ("Unscheduled tasks" :buffers-files org-agenda-files
        :query (and (not (done)) (not (ts-active)) (todo) (not (todo "INACTIVE")))
        :sort (priority) :title "Unscheduled tasks" :super-groups
        ((:auto-property "project-name")
         (:name "Work-related" :tag ("neu" "eece4534" "esl") :file-path "neu-agenda")
         (:name "Personal and others" :file-path "agenda")))
       ;; Oneshot: miscellaneous stuff, one off items
       ("Oneshot tasks" :buffers-files org-agenda-files
        :query (and (not (done)) (or (tags "oneshot") (todo "REFILE"))) :sort (priority) :title "Oneshot and miscellaneous tasks"
        :super-groups ((:name "Isolated, oneshot, misc" :anything t)))
       ;; Project clocks
       ("Project clocks" :buffers-files (lambda () (directory-files-recursively dotspacemacs-org-directory "^[^#]+\.org$"))
        :query (and (not (done)) (or (property "project-clock") (clocked))) :title "Project clocks"
        :super-groups ((:auto-property "project-name") (:name "Uncategorized clocks" :auto-group t)))
       ("In progress" :buffers-files org-agenda-files
        :query (todo "NEXT") :title "In progress"
        :super-groups ((:auto-property "project-name") (:auto-group t)))
       ("All TODOs" :buffers-files org-agenda-files
        :query (and (todo) (not (done)) (not (property "query-hide" "yes")) (not (org-entry-get (point) "archived" 'inherit))
                    (not (todo "INACTIVE")) (not (todo "REFILE"))) :title "All TODO items"
        :super-groups ((:auto-property "project-name") (:auto-group t) (:auto-category t)))))
    )

  ;; Configure org-agenda
  (with-eval-after-load 'org-agenda
    (setq org-agenda-span 'day)
    (require 'org-projectile)
    (require 'org-super-agenda)
    (setq org-agenda-block-separator nil)
    (setq org-agenda-compact-blocks t)
    (add-to-list 'org-agenda-custom-commands `,bmorais/org-agenda-todo-view)
    (add-to-list 'org-agenda-custom-commands `,bmorais/org-agenda-family-view)
    (org-super-agenda-mode 1))

  ;; auto-format python
  (setq blacken-line-length 79) ;; PEP-8 annoying value

  ;; (ad-activate 'virtualenv-activate)

  (setq org-confirm-babel-evaluate nil)

  (setq neo-theme 'icons)

  ;; configuration for spaceline-all-the-icons
  (if (eq (spacemacs/get-mode-line-theme-name) 'all-the-icons)
      (progn
        (spaceline-toggle-all-the-icons-hud-off)
        (spaceline-toggle-all-the-icons-buffer-size-off)
        (spaceline-toggle-all-the-icons-time-off)
        (setq spaceline-all-the-icons-separators-invert-direction 1)
        (setq powerline-default-separator 'arrow)

        (spaceline-define-segment all-the-icons-org-clock-current-task
          "An `all-the-icons' segment to display the current org-clock task."
          (let ((face `(:height ,(spaceline-all-the-icons--height 0.9) :inherit)))
            (propertize
             (concat
              (propertize (all-the-icons-faicon "clock-o" :v-adjust 0.1)
                          'face `(:height ,(spaceline-all-the-icons--height 1.1) :family ,(all-the-icons-faicon-family) :inherit))
              " "
              (propertize (truncate-string-to-width (org-clock-get-clock-string) 20 nil nil "…")
                          'face face
                          'display '(raise 0.1)))
             'help-echo "Go to task"
             'mouse-face (spaceline-all-the-icons--highlight)
             'local-map (make-mode-line-mouse-map 'mouse-1 #'org-clock-goto)))
          :when (and active
                     (bound-and-true-p org-clock-current-task)))))

  ;; configuration for doom-modeline
  (if (eq (spacemacs/get-mode-line-theme-name) 'doom)
      (progn
        (setq doom-modeline-checker-simple-format nil)
        (setq doom-modeline-buffer-encoding nil)
        (setq doom-modeline-buffer-file-name-style 'truncate-with-project)
        (setq doom-modeline-project-detection 'projectile)
        (setq doom-modeline-height 1)
        (setq doom-modeline-github t)
        (set-face-attribute 'mode-line nil :height 90)
        (set-face-attribute 'mode-line-inactive nil :height 90)
        (set-face-attribute 'doom-modeline-bar nil :background "#ffb300")
        (set-face-attribute 'doom-modeline-evil-insert-state nil :foreground "green")
        (set-face-attribute 'doom-modeline-evil-normal-state nil :foreground "#ffb300")
        (set-face-attribute 'doom-modeline-evil-visual-state nil :foreground "DimGrey")
        (set-face-attribute 'doom-modeline-evil-replace-state nil :foreground "red2")
        (set-face-attribute 'doom-modeline-evil-emacs-state nil :foreground "DeepSkyBlue")
        ))

  (require 'dap-lldb)

  (doom-themes-org-config)
  (doom-themes-neotree-config)
  ;; (customize-set-variable 'helm-ff-lynx-style-map t)

  ;; transparency
  ;; (set-frame-parameter (selected-frame) 'alpha '(95 . 90))
  ;; (add-to-list 'default-frame-alist '(alpha . (95 . 90)))

  ;; lsp stuff
  (setq lsp-file-watch-threshold 2000)
  (setq company-lsp-cache-candidates 'auto)

  ;; merge from old custom layer
  (setq shell-file-name "/bin/bash")
  (setq explicit-shell-file-name "/bin/bash")

  ;; enable fill ruler
  (spacemacs/add-to-hooks 'spacemacs/toggle-fill-column-indicator-on
                          '(python-mode-hook c-mode-hook scala-mode-hook elisp-mode))

  ;; lsp-focus
  (add-hook 'focus-mode-hook #'lsp-focus-mode)
  ;; add mnemonic keybinding
  (spacemacs/set-leader-keys "bf" 'focus-mode)

  ;; deft directory
  (setq deft-directory (concat dotspacemacs-org-directory "zettelkasten"))
  (setq deft-recursive t)

  (setq read-process-output-max (* 1024 1024))

  ;; icons in dired mode
  (add-hook 'dired-mode-hook 'all-the-icons-dired-mode)

  ;; save automatically on clock in/out
  (add-hook 'org-clock-in-hook #'save-buffer)
  (add-hook 'org-clock-out-hook #'save-buffer)

  ;; customize org-super-agenda and other org styles
  (with-eval-after-load 'org-ql-view
    (set-face-attribute 'org-ql-view-due-date nil
                        :weight 'bold
                        :slant 'oblique
                        :foreground "DarkOrange1"
                        :underline t))
  (with-eval-after-load 'org-super-agenda
    (set-face-attribute 'org-super-agenda-header nil
                        :font "Iosevka Bold 18"
                        :overline t))
  (with-eval-after-load 'org
    (set-face-attribute 'org-todo nil
                        :foreground "#252525"
                        :background "#ffb300"
                        :distant-foreground "#ffb300"))

  (require 'auth-source-pass)
  (auth-source-pass-enable)
  (defvar +icons-prefer-nerd-font t)

  (require 'tree-sitter)
  (require 'tree-sitter-langs)
  (global-tree-sitter-mode)

  ;; dogears
  (dogears-mode 1)
  (spacemacs/set-leader-keys "bgl" 'dogears-list)
  (spacemacs/set-leader-keys "bgb" 'dogears-back)
  (spacemacs/set-leader-keys "bgf" 'dogears-forward)
  (spacemacs/set-leader-keys "bgr" 'dogears-remember)
  (spacemacs/set-leader-keys "bgg" 'dogears-go)
  )
;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("a8c210aa94c4eae642a34aaf1c5c0552855dfca2153fa6dd23f3031ce19453d4" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" "11e57648ab04915568e558b77541d0e94e69d09c9c54c06075938b6abc0189d8" "fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" default))
 '(ein:output-area-inlined-images t)
 '(evil-want-Y-yank-to-eol nil)
 '(highlight-indent-guides-method 'bitmap)
 '(js-indent-level 2)
 '(json-reformat:indent-width 2)
 '(org-agenda-files
   '("~/work/org/personal/agenda.org" "~/work/org/personal/ideas.org" "~/work/org/neu/neu-agenda.org" "~/work/org/neu/esl/4534clock2020.org" "~/work/org/oneshot.org" "~/work/org/inbox.org" "~/work/org/neu/esl/acc_coupling/planning.org" "~/work/org/neu/esl/ilpform/planning.org"))
 '(package-selected-packages
   '(ron-mode helm-gtags rust-mode doom-monokai-classic-theme yapfify yaml-mode xterm-color xcscope ws-butler winum which-key wgrep web-mode web-beautify volatile-highlights vi-tilde-fringe uuidgen use-package toml-mode toc-org textx-mode tagedit systemd spotify spaceline solaire-mode smex smeargle slim-mode slack shell-pop scss-mode scala-mode sbt-mode sass-mode restart-emacs rainbow-delimiters racer pyvenv pytest pyenv-mode py-isort pug-mode popwin plantuml-mode pip-requirements persp-mode paradox ox-reveal ox-hugo ox-gfm orgit org-ref org-projectile org-present org-pomodoro org-mime org-download org-caldav org-bullets open-junk-file noflet neotree multi-term move-text markdown-toc magit-todos magit-gitflow magit-gh-pulls macrostep lsp-focus lorem-ipsum livid-mode live-py-mode linum-relative link-hint js2-refactor js-doc ivy-hydra insert-shebang indent-guide imenu-list ibuffer-projectile hy-mode hungry-delete highlight-parentheses highlight-numbers highlight-indentation helm-make google-translate golden-ratio gnuplot gitignore-mode github-search github-clone github-browse-file gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link gist gh-md ggtags fuzzy flyspell-correct-ivy flycheck-rust flycheck-pos-tip flx-ido fish-mode fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-args evil-anzu eval-sexp-fu ess-smart-equals ess-R-data-view eshell-z eshell-prompt-extras esh-help emmet-mode elisp-slime-nav dumb-jump doom-themes dockerfile-mode docker disaster diminish deft define-word cython-mode counsel-projectile company-web company-statistics company-shell company-c-headers company-auctex company-anaconda column-enforce-mode coffee-mode cmake-mode clean-aindent-mode clang-format cargo bitbake auto-yasnippet auto-highlight-symbol auto-dictionary auto-compile auctex-latexmk all-the-icons-ivy-rich all-the-icons-dired aggressive-indent adaptive-wrap ace-window ace-link ac-ispell))
 '(verilog-auto-newline nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
)
