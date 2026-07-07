(require 'package)
(setq package-archives
      '(("MELPA"        . "https://melpa.org/packages/")
        ("GNU ELPA"     . "https://elpa.gnu.org/packages/")))
(setq package-install-upgrade-built-in t)
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

;; set custom file so it doesn't polute ~/.emacs/init.el
(let ((default-custom (concat user-emacs-directory "custom.el")))
  (setq custom-file default-custom)
  (when (file-exists-p default-custom)
    (load-file default-custom)))

;; set backup folder to /tmp/.emacs~
(let ((backups-folder "/tmp/.emacs~"))
  (setq backup-directory-alist `(("." . ,backups-folder)))
  (make-directory backups-folder :parents))

(add-to-list 'load-path (concat user-emacs-directory "/lisp"))
(require 'nix-develop)

(when (display-graphic-p)
  (set-face-attribute
   'default nil
   :family "Iosevka Custom"
   :height 105)
  (set-face-attribute
   'variable-pitch nil
   :family "Iosevka Custom"
   :height 105))

(savehist-mode)
(set-frame-parameter nil 'internal-border-width 0)

;; add treesitter folders from
;; https://cgit.git.savannah.gnu.org/cgit/emacs.git/tree/admin/notes/tree-sitter/starter-guide?h=feature/tree-sitter
;; to my treesit-extra-load-path
(setq treesit-extra-load-path '("~/.emacs.d/tree-sitter/"))
(setq treesit-font-lock-level 4)
(dolist (lang '(("\\.rs\\'" . rust-ts-mode)
                ("\\.nix\\'" . nix-ts-mode)))
  (add-to-list 'auto-mode-alist lang))
(setq-default truncate-lines t)

;; disable GTK window decorations
(add-to-list 'default-frame-alist '(undecorated . t))
(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)

(add-hook 'prog-mode-hook 'display-line-numbers-mode)
(add-hook 'tex-mode-hook 'visual-line-mode)
(add-hook 'org-mode-hook 'visual-line-mode)
(add-hook 'emacs-lisp-mode-hook
          (lambda ()
            (setq-local indent-tabs-mode nil)))
(add-to-list 'custom-theme-load-path (concat user-emacs-directory "/themes"))
(load-theme 'bloop-nvim-light)
(global-set-key [remap list-buffers] 'ibuffer)

(use-package meow
  :ensure t
  :config
  (require 'meow-setup)
  (meow-setup)
  (meow-global-mode 1))

(use-package highlight-indent-guides
  :ensure t
  :init
  (setq highlight-indent-guides-method 'character)
  :hook (prog-mode . highlight-indent-guides-mode))

(use-package zig-ts-mode
  :ensure t)

(use-package rainbow-mode
  :ensure t
  :init
  (setq rainbow-x-colors nil)
  (setq rainbow-html-colors nil)
  :hook (prog-mode . rainbow-mode))

(use-package rainbow-delimiters
  :ensure t
  :hook (emacs-lisp-mode . rainbow-delimiters-mode))

(use-package multiple-cursors
  :ensure t
  :bind ("C-c C-c" . mc/edit-lines))

(use-package ligature
  :ensure t
  :init
  (let* ((symbols (mapcar #'char-to-string (string-to-list "-+\\*/~<=>!@#%^&|:?"))))
    (ligature-set-ligatures 'prog-mode
                            (mapcar (lambda (symbol) (list symbol `(rx (>= 1 (any ,@symbols)))))
                                    symbols)))
  :hook (prog-mode . ligature-mode))

(use-package ansi-color
  :ensure t
  :hook (compilation-filter-hook . ansi-color-compilation-filter))

(use-package ido
  :ensure t
  :config
  (ido-mode))

(use-package smex
  :ensure t
  :init
  (global-set-key (kbd "M-x") 'smex)
  (global-set-key (kbd "M-X") 'smex-major-mode-commands)
  (global-set-key (kbd "C-x M-x") 'execute-extended-command)
  :config
  (smex-initialize))

(use-package windmove
  :ensure t
  :config
  (windmove-default-keybindings))

(use-package highlight-numbers
  :ensure t
  :hook (prog-mode . highlight-numbers-mode))

(use-package haskell-ts-mode
  :ensure t
  :vc (:url "https://codeberg.org/pranshu/haskell-ts-mode")
  :custom
  (haskell-ts-font-lock-level 4)
  (haskell-ts-use-indent t)
  (haskell-ts-ghci "ghci")
  (haskell-ts-use-indent t)
  :config
  (add-to-list 'auto-mode-alist '("\\.hs\\'" . haskell-ts-mode))
  (setq haskell-ts-font-lock
        (append haskell-ts-font-lock
                (treesit-font-lock-rules
                 :language 'haskell
                 :feature 'call
                 '((apply function: (variable) @font-lock-function-name-face)))))
  (add-to-list 'haskell-ts-font-lock-feature-list '(call)))

(use-package eldoc-box
  :ensure t
  :config
  (setq eldoc-box-cleanup-interval 2
        eldoc-box-max-pixel-height 900
        eldoc-box-max-pixel-width 1500)
  :bind ("C-c ?" . eldoc-box-help-at-point))

(use-package corfu
  :ensure t
  :custom
  (corfu-auto t)
  (corfu-auto-delay 0.1)
  (corfu-auto-prefix 1)
  :init
  (global-corfu-mode))

(use-package markdown-mode
  :ensure t)

(use-package nix-ts-mode
  :ensure t)
