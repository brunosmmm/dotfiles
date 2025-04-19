;; -*- mode: emacs-lisp; lexical-binding: t -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Layer configuration:
This function should only modify configuration layer settings."
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

   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()

   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(csv
     octave
     rust
     (ivy :variables ivy-enable-advanced-buffer-information t ivy-enable-icons t)
     ;; helm
     ess
     emacs-lisp
     yaml
     shell-scripts
     ;; html
     javascript
     (auto-completion :variables auto-completion-use-company-box t)
     (git :variables git-enable-magit-todos-plugin t)
     (python :variables python-test-runner 'pytest python-backend 'lsp python-lsp-server 'pylsp python-formatter 'black python-format-on-save t python-poetry-activate t)
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
     (lsp :variables lsp-pyls-plugins-jedi-use-pyenv-environment t lsp-signature-auto-activate nil lsp-lens-enable nil)
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
     (unicode-fonts)
     (graphviz)
     fountain
     )


   ;; List of additional packages that will be installed without being wrapped
   ;; in a layer (generally the packages are installed only and should still be
   ;; loaded using load/require/use-package in the user-config section below in
   ;; this file). If you need some configuration for these packages, then
   ;; consider creating a layer. You can also put the configuration in
   ;; `dotspacemacs/user-config'. To use a local version of a package, use the
   ;; `:location' property: '(your-package :location "~/path/to/your-package/")
   ;; Also include the dependencies as they will not be resolved automatically.
   dotspacemacs-additional-packages '(
                                      (sedona-mode :location
                                                   (recipe :fetcher github :repo "brunosmmm/sedona-mode"))
                                      (latexmk-compile-mode :location
                                                            (recipe :fetcher github :repo "brunosmmm/latexmk-utils"))
                                      all-the-icons-dired
                                      bitbake
                                      doom-themes
                                      (textx-mode :location (recipe :fetcher github :repo "brunosmmm/textx-mode"))
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
                                      org-static-blog
                                      powerthesaurus
                                      scad-mode
                                      )

   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()

   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '(ensime)

   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and deletes any unused
   ;; packages as well as their unused dependencies. `used-but-keep-unused'
   ;; installs only the used packages but won't delete unused ones. `all'
   ;; installs *all* packages supported by Spacemacs and never uninstalls them.
   ;; (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization:
This function is called at the very beginning of Spacemacs startup,
before layer configuration.
It should only modify the values of Spacemacs settings."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non-nil then enable support for the portable dumper. You'll need to
   ;; compile Emacs 27 from source following the instructions in file
   ;; EXPERIMENTAL.org at to root of the git repository.
   ;;
   ;; WARNING: pdumper does not work with Native Compilation, so it's disabled
   ;; regardless of the following setting when native compilation is in effect.
   ;;
   ;; (default nil)
   dotspacemacs-enable-emacs-pdumper nil

   ;; Name of executable file pointing to emacs 27+. This executable must be
   ;; in your PATH.
   ;; (default "emacs")
   dotspacemacs-emacs-pdumper-executable-file "emacs"

   ;; Name of the Spacemacs dump file. This is the file will be created by the
   ;; portable dumper in the cache directory under dumps sub-directory.
   ;; To load it when starting Emacs add the parameter `--dump-file'
   ;; when invoking Emacs 27.1 executable on the command line, for instance:
   ;;   ./emacs --dump-file=$HOME/.emacs.d/.cache/dumps/spacemacs-27.1.pdmp
   ;; (default (format "spacemacs-%s.pdmp" emacs-version))
   dotspacemacs-emacs-dumper-dump-file (format "spacemacs-%s.pdmp" emacs-version)

   ;; If non-nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t

   ;; Maximum allowed time in seconds to contact an ELPA repository.
   ;; (default 5)
   dotspacemacs-elpa-timeout 5

   ;; Set `gc-cons-threshold' and `gc-cons-percentage' when startup finishes.
   ;; This is an advanced option and should not be changed unless you suspect
   ;; performance issues due to garbage collection operations.
   ;; (default '(100000000 0.1))
   dotspacemacs-gc-cons '(100000000 0.1)

   ;; Set `read-process-output-max' when startup finishes.
   ;; This defines how much data is read from a foreign process.
   ;; Setting this >= 1 MB should increase performance for lsp servers
   ;; in emacs 27.
   ;; (default (* 1024 1024))
   dotspacemacs-read-process-output-max (* 1024 1024)

   ;; If non-nil then Spacelpa repository is the primary source to install
   ;; a locked version of packages. If nil then Spacemacs will install the
   ;; latest version of packages from MELPA. Spacelpa is currently in
   ;; experimental state please use only for testing purposes.
   ;; (default nil)
   dotspacemacs-use-spacelpa nil

   ;; If non-nil then verify the signature for downloaded Spacelpa archives.
   ;; (default t)
   dotspacemacs-verify-spacelpa-archives t

   ;; If non-nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil

   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'. (default 'emacs-version)
   dotspacemacs-elpa-subdirectory 'emacs-version

   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'vim

   ;; If non-nil show the version string in the Spacemacs buffer. It will
   ;; appear as (spacemacs version)@(emacs version)
   ;; (default t)
   dotspacemacs-startup-buffer-show-version t

   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official

   ;; Scale factor controls the scaling (size) of the startup banner. Default
   ;; value is `auto' for scaling the logo automatically to fit all buffer
   ;; contents, to a maximum of the full image height and a minimum of 3 line
   ;; heights. If set to a number (int or float) it is used as a constant
   ;; scaling factor for the default logo size.
   dotspacemacs-startup-banner-scale 'auto

   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `recents-by-project' `bookmarks' `projects' `agenda' `todos'.
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   ;; The exceptional case is `recents-by-project', where list-type must be a
   ;; pair of numbers, e.g. `(recents-by-project . (7 .  5))', where the first
   ;; number is the project limit and the second the limit on the recent files
   ;; within a project.
   dotspacemacs-startup-lists '((recents . 8)
                                (bookmarks . 8)
                                (projects . 8))

   ;; True if the home buffer should respond to resize events. (default t)
   dotspacemacs-startup-buffer-responsive t

   ;; Show numbers before the startup list lines. (default t)
   dotspacemacs-show-startup-list-numbers t

   ;; The minimum delay in seconds between number key presses. (default 0.4)
   dotspacemacs-startup-buffer-multi-digit-delay 0.4

   ;; If non-nil, show file icons for entries and headings on Spacemacs home buffer.
   ;; This has no effect in terminal or if "all-the-icons" package or the font
   ;; is not installed. (default nil)
   dotspacemacs-startup-buffer-show-icons nil

   ;; Default major mode for a new empty buffer. Possible values are mode
   ;; names such as `text-mode'; and `nil' to use Fundamental mode.
   ;; (default `text-mode')
   dotspacemacs-new-empty-buffer-major-mode 'text-mode

   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode

   ;; If non-nil, *scratch* buffer will be persistent. Things you write down in
   ;; *scratch* buffer will be saved and restored automatically.
   dotspacemacs-scratch-buffer-persistent nil

   ;; If non-nil, `kill-buffer' on *scratch* buffer
   ;; will bury it instead of killing.
   dotspacemacs-scratch-buffer-unkillable nil

   ;; Initial message in the scratch buffer, such as "Welcome to Spacemacs!"
   ;; (default nil)
   dotspacemacs-initial-scratch-message nil

   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press `SPC T n' to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(doom-monokai-classic
                         doom-nord-light)

   ;; Set the theme for the Spaceline. Supported themes are `spacemacs',
   ;; `all-the-icons', `custom', `doom', `vim-powerline' and `vanilla'. The
   ;; first three are spaceline themes. `doom' is the doom-emacs mode-line.
   ;; `vanilla' is default Emacs mode-line. `custom' is a user defined themes,
   ;; refer to the DOCUMENTATION.org for more info on how to create your own
   ;; spaceline theme. Value can be a symbol or list with additional properties.
   ;; (default '(spacemacs :separator wave :separator-scale 1.5))
   dotspacemacs-mode-line-theme '(doom)

   ;; If non-nil the cursor color matches the state color in GUI Emacs.
   ;; (default t)
   dotspacemacs-colorize-cursor-according-to-state t

   ;; Default font or prioritized list of fonts. The `:size' can be specified as
   ;; a non-negative integer (pixel size), or a floating-point (point size).
   ;; Point size is recommended, because it's device independent. (default 10.0)
   dotspacemacs-default-font '("Iosevka"
                               :size 18
                               :weight normal
                               :width normal
                               :powerline-scale 1.0)

   ;; The leader key (default "SPC")
   dotspacemacs-leader-key "SPC"

   ;; The key used for Emacs commands `M-x' (after pressing on the leader key).
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
   ;; (default "C-M-m" for terminal mode, "<M-return>" for GUI mode).
   ;; Thus M-RET should work as leader key in both GUI and terminal modes.
   ;; C-M-m also should work in terminal mode, but not in GUI mode.
   dotspacemacs-major-mode-emacs-leader-key (if window-system "<M-return>" "C-M-m")

   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs `C-i', `TAB' and `C-m', `RET'.
   ;; Setting it to a non-nil value, allows for separate commands under `C-i'
   ;; and TAB or `C-m' and `RET'.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil

   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"

   ;; If non-nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil

   ;; If non-nil then the last auto saved layouts are resumed automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil

   ;; If non-nil, auto-generate layout name when creating new layouts. Only has
   ;; effect when using the "jump to layout by number" commands. (default nil)
   dotspacemacs-auto-generate-layout-names nil

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

   ;; If non-nil, the paste transient-state is enabled. While enabled, after you
   ;; paste something, pressing `C-j' and `C-k' several times cycles through the
   ;; elements in the `kill-ring'. (default nil)
   dotspacemacs-enable-paste-transient-state nil

   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4

   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom

   ;; Control where `switch-to-buffer' displays the buffer. If nil,
   ;; `switch-to-buffer' displays the buffer in the current window even if
   ;; another same-purpose window is available. If non-nil, `switch-to-buffer'
   ;; displays the buffer in a same-purpose window even if the buffer can be
   ;; displayed in the current window. (default nil)
   dotspacemacs-switch-to-buffer-prefers-purpose nil

   ;; If non-nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t

   ;; If non-nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil

   ;; If non-nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil

   ;; If non-nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default t) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup t

   ;; If non-nil the frame is undecorated when Emacs starts up. Combine this
   ;; variable with `dotspacemacs-maximized-at-startup' to obtain fullscreen
   ;; without external boxes. Also disables the internal border. (default nil)
   dotspacemacs-undecorated-at-startup nil

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90

   ;; A value from the range (0..100), in increasing opacity, which describes the
   ;; transparency level of a frame background when it's active or selected. Transparency
   ;; can be toggled through `toggle-background-transparency'. (default 90)
   dotspacemacs-background-transparency 90

   ;; If non-nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t

   ;; If non-nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t

   ;; If non-nil unicode symbols are displayed in the mode line.
   ;; If you use Emacs as a daemon and wants unicode characters only in GUI set
   ;; the value to quoted `display-graphic-p'. (default t)
   dotspacemacs-mode-line-unicode-symbols t

   ;; If non-nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t

   ;; Show the scroll bar while scrolling. The auto hide time can be configured
   ;; by setting this variable to a number. (default t)
   dotspacemacs-scroll-bar-while-scrolling t

   ;; Control line numbers activation.
   ;; If set to `t', `relative' or `visual' then line numbers are enabled in all
   ;; `prog-mode' and `text-mode' derivatives. If set to `relative', line
   ;; numbers are relative. If set to `visual', line numbers are also relative,
   ;; but only visual lines are counted. For example, folded lines will not be
   ;; counted and wrapped lines are counted as multiple lines.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :visual nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; When used in a plist, `visual' takes precedence over `relative'.
   ;; (default nil)
   dotspacemacs-line-numbers t

   ;; Code folding method. Possible values are `evil', `origami' and `vimish'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil

   ;; If non-nil and `dotspacemacs-activate-smartparens-mode' is also non-nil,
   ;; `smartparens-strict-mode' will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil

   ;; If non-nil smartparens-mode will be enabled in programming modes.
   ;; (default t)
   dotspacemacs-activate-smartparens-mode t

   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc...
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil

   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all

   ;; If non-nil, start an Emacs server if one is not already running.
   ;; (default nil)
   dotspacemacs-enable-server nil

   ;; Set the emacs server socket location.
   ;; If nil, uses whatever the Emacs default is, otherwise a directory path
   ;; like \"~/.emacs.d/server\". It has no effect if
   ;; `dotspacemacs-enable-server' is nil.
   ;; (default nil)
   dotspacemacs-server-socket-dir nil

   ;; If non-nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil

   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `rg', `ag', `pt', `ack' and `grep'.
   ;; (default '("rg" "ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("rg" "ag" "pt" "ack" "grep")

   ;; Format specification for setting the frame title.
   ;; %a - the `abbreviated-file-name', or `buffer-name'
   ;; %t - `projectile-project-name'
   ;; %I - `invocation-name'
   ;; %S - `system-name'
   ;; %U - contents of $USER
   ;; %b - buffer name
   ;; %f - visited file name
   ;; %F - frame name
   ;; %s - process status
   ;; %p - percent of buffer above top of window, or Top, Bot or All
   ;; %P - percent of buffer above bottom of window, perhaps plus Top, or Bot or All
   ;; %m - mode name
   ;; %n - Narrow if appropriate
   ;; %z - mnemonics of buffer, terminal, and keyboard coding systems
   ;; %Z - like %z, but including the end-of-line format
   ;; If nil then Spacemacs uses default `frame-title-format' to avoid
   ;; performance issues, instead of calculating the frame title by
   ;; `spacemacs/title-prepare' all the time.
   ;; (default "%I@%S")
   dotspacemacs-frame-title-format "%I@%S"

   ;; Format specification for setting the icon title format
   ;; (default nil - same as frame-title-format)
   dotspacemacs-icon-title-format nil

   ;; Color highlight trailing whitespace in all prog-mode and text-mode derived
   ;; modes such as c++-mode, python-mode, emacs-lisp, html-mode, rst-mode etc.
   ;; (default t)
   dotspacemacs-show-trailing-whitespace t

   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed' to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil

   ;; If non-nil activate `clean-aindent-mode' which tries to correct
   ;; virtual indentation of simple modes. This can interfere with mode specific
   ;; indent handling like has been reported for `go-mode'.
   ;; If it does deactivate it here.
   ;; (default t)
   dotspacemacs-use-clean-aindent-mode t

   ;; Accept SPC as y for prompts if non-nil. (default nil)
   dotspacemacs-use-SPC-as-y nil

   ;; If non-nil shift your number row to match the entered keyboard layout
   ;; (only in insert state). Currently supported keyboard layouts are:
   ;; `qwerty-us', `qwertz-de' and `querty-ca-fr'.
   ;; New layouts can be added in `spacemacs-editing' layer.
   ;; (default nil)
   dotspacemacs-swap-number-row nil

   ;; Either nil or a number of seconds. If non-nil zone out after the specified
   ;; number of seconds. (default nil)
   dotspacemacs-zone-out-when-idle nil

   ;; Run `spacemacs/prettify-org-buffer' when
   ;; visiting README.org files of Spacemacs.
   ;; (default nil)
   dotspacemacs-pretty-docs nil

   ;; If nil the home buffer shows the full path of agenda items
   ;; and todos. If non-nil only the file name is shown.
   dotspacemacs-home-shorten-agenda-source nil

   ;; If non-nil then byte-compile some of Spacemacs files.
   dotspacemacs-byte-compile nil))

(defun dotspacemacs/user-env ()
  "Environment variables setup.
This function defines the environment variables for your Emacs session. By
default it calls `spacemacs/load-spacemacs-env' which loads the environment
variables declared in `~/.spacemacs.env' or `~/.spacemacs.d/.spacemacs.env'.
See the header of this file for more information."
  (spacemacs/load-spacemacs-env)
  )

(defun dotspacemacs/user-init ()
  "Initialization for user code:
This function is called immediately after `dotspacemacs/init', before layer
configuration.
It is mostly for variables that should be set before packages are loaded.
If you are unsure, try setting them in `dotspacemacs/user-config' first."
  ;; (setq dotspacemacs-mode-line-theme '(spacemacs))
  ;; (setq comp-deferred-compilation t)
  ;;  (add-hook 'prog-mode-hook 'highlight-indent-guides-mode)
  )


(defun dotspacemacs/user-load ()
  "Library to load while dumping.
This function is called only while dumping Spacemacs configuration. You can
`require' or `load' the libraries of your choice that will be included in the
dump."
  )


(defun dotspacemacs/user-config ()
  "Configuration for user code:
This function is called at the very end of Spacemacs startup, after layer
configuration.
Put your configuration code here, except for variables that should be set
before packages are loaded."
  (setq dotspacemacs-org-directory "~/work/org/")
  (add-to-list 'exec-path "~/.local/bin/")

  ;;c++: do not indent inside namespaces
  (c-set-offset 'innamespace 0)

  ;; SCons highlighting (Python)
  (add-to-list 'auto-mode-alist '("SConstruct" . python-mode))
  (add-to-list 'auto-mode-alist '("SConscript" . python-mode))

  ;;switch buffers with shift
  (windmove-default-keybindings)

  ;;flycheck force C++11
  ;; (add-hook 'c++-mode-hook (lambda () (setq flycheck-gcc-language-standard "c++11")))
  ;; (add-hook 'c++-mode-hook (lambda () (setq flycheck-clang-language-standard "c++11")))

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

  (defun my/fix-inline-images ()
    (when org-inline-image-overlays
      (org-redisplay-inline-images)))

  ;; org config
  (with-eval-after-load 'org
    (setq org-directory dotspacemacs-org-directory)
    (require 'org-protocol)
    (setq org-journal-enable-agenda-integration t)
    (setq org-journal-dir (concat dotspacemacs-org-directory "journal"))
    (setq org-plantuml-jar-path "/usr/share/java/plantuml/plantuml.jar")
    (org-babel-do-load-languages 'org-babel-load-languages
                                 '((plantuml . t) (shell . t) (R . t) (python . t) (dot . t)))

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

    (add-hook 'org-babel-after-execute-hook 'my/fix-inline-images)
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
        ;; (set-face-attribute 'doom-modeline-bar nil :background "#ffb300")
        ;; (set-face-attribute 'doom-modeline-evil-insert-state nil :foreground "green")
        ;; (set-face-attribute 'doom-modeline-evil-normal-state nil :foreground "#ffb300")
        ;; (set-face-attribute 'doom-modeline-evil-visual-state nil :foreground "DimGrey")
        ;; (set-face-attribute 'doom-modeline-evil-replace-state nil :foreground "red2")
        ;; (set-face-attribute 'doom-modeline-evil-emacs-state nil :foreground "DeepSkyBlue")
        ))

  ;; (require 'dap-lldb)

  (doom-themes-org-config)
  (doom-themes-neotree-config)
  ;; (customize-set-variable 'helm-ff-lynx-style-map t)

  ;; transparency
  (set-frame-parameter nil 'alpha-background 90)

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

  (add-to-list 'auto-mode-alist '("\\.bb\\'" . bitbake-mode))
  (setq undo-tree-enable-undo-in-region t)

  (pixel-scroll-precision-mode 1)
  (setq pixel-scroll-precision-large-scroll-height 20.0)
  (setq pixel-scroll-precision-interpolation-factor 30)
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
   '(package-selected-packages
     '(csv-mode company-box frame-local lsp-docker aio nerd-icons anaphora helm-core closql elisp-refs bui yaml ts citeproc emacsql powerthesaurus hybrid-mode holy-mode evil-evilified-state dotenv-mode diminish zetteldeft yapfify ws-butler writeroom-mode winum wgrep web-beautify vim-powerline vi-tilde-fringe uuidgen unicode-fonts undo-tree toml-mode toc-org textx-mode terminal-here term-cursor systemd symon spotify sphinx-doc spacemacs-purpose-popwin space-doc smex smeargle slack shfmt shell-pop sedona-mode scala-mode sbt-mode rust-mode ron-mode restart-emacs rainbow-delimiters quickrun pytest pylookup pyenv-mode pydoc py-isort prettier-js popwin plantuml-mode pippel pipenv pip-requirements paradox ox-gfm overseer org-superstar org-projectile org-present org-pomodoro org-journal org-download org-contrib org-cliplink open-junk-file npm-mode nose nodejs-repl nerd-fonts nameless mvn multi-vterm multi-term meson-mode maven-test-mode markdown-toc lsp-ui lsp-python-ms lsp-origami lsp-ivy lsp-focus lorem-ipsum livid-mode latexmk-compile-mode json-reformat json-navigator json-mode js2-refactor js-doc journalctl-mode ivy-yasnippet ivy-xref ivy-rtags ivy-purpose ivy-bibtex insert-shebang indent-guide importmagic ibuffer-projectile hungry-delete highlight-parentheses highlight-numbers highlight-indentation highlight-indent-guides hide-comnt help-fns+ helm-make groovy-imports google-translate google-c-style golden-ratio gitignore-templates git-messenger gh-md gendoxy fuzzy flyspell-correct-ivy flycheck-ycmd flycheck-rust flycheck-rtags flycheck-pos-tip flycheck-package flycheck-bashate flx-ido fancy-battery eyebrowse expand-region evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-textobj-line evil-tex evil-org evil-numbers evil-lisp-state evil-lion evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-args evil-anzu eval-sexp-fu ess-R-data-view eshell-z eshell-prompt-extras esh-help emr emoji-cheat-sheet-plus elisp-slime-nav elisp-def dockerfile-mode define-word cython-mode cpp-auto-include counsel-spotify counsel-projectile counsel-gtags company-ycmd company-shell company-rtags company-reftex company-math company-emoji company-c-headers company-auctex company-anaconda column-enforce-mode code-cells cmake-ide clean-aindent-mode centered-cursor-mode ccls cargo bufler bitbake auto-yasnippet auto-highlight-symbol auto-dictionary auctex-latexmk all-the-icons-dired aggressive-indent ace-link ac-ispell which-key yasnippet-snippets yaml-mode xterm-color xcscope volatile-highlights treemacs-icons-dired treemacs-evil tree-sitter-langs symbol-overlay spaceline scad-mode poetry org-static-blog org-rich-yank org-re-reveal org-mime org-caldav olivetti macrostep lsp-pyright lsp-latex lsp-treemacs live-py-mode link-hint ivy-hydra ivy-avy inspector info+ groovy-mode graphviz-dot-mode gnuplot git-timemachine git-modes git-link ggtags fountain-mode fish-mode evil-surround evil-nerd-commenter evil-mc evil-matchit evil-goggles evil-collection evil-cleverparens dumb-jump doom-themes dogears disaster devdocs cmake-mode blacken auto-compile treemacs-projectile treemacs-persp treemacs-magit orgit magit-todos flycheck-elsa all-the-icons-ivy-rich move-text jeison treepy string-inflection)))
  (custom-set-faces
   ;; custom-set-faces was added by Custom.
   ;; If you edit it by hand, you could mess it up, so be careful.
   ;; Your init file should contain only one such instance.
   ;; If there is more than one, they won't work right.
   )
  )
