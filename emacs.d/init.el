(require 'package)
(setq package-archives
      '(("MELPA"        . "https://melpa.org/packages/")
        ("GNU ELPA"     . "https://elpa.gnu.org/packages/")))
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

;; set custom file so it doesn't polute ~/.emacs
(let ((default-custom (concat user-emacs-directory "custom.el")))
  (setq custom-file default-custom)
  (when (file-exists-p default-custom)
    (load-file default-custom)))

;; set backup folder to /tmp/.emacs~
(let ((backups-folder "/tmp/.emacs~"))
  (setq backup-directory-alist `(("." . ,backups-folder)))
  (make-directory backups-folder :parents))

(when (display-graphic-p)
  (set-face-attribute
   'default nil
   :family "Iosevka Custom"
   :height 120)
  (set-face-attribute
   'variable-pitch nil
   :family "Iosevka Custom"
   :height 120))

(savehist-mode)
(set-frame-parameter nil 'internal-border-width 0)

;; add treesitter folders from
;; https://cgit.git.savannah.gnu.org/cgit/emacs.git/tree/admin/notes/tree-sitter/starter-guide?h=feature/tree-sitter
;; to my treesit-extra-load-path
(setq treesit-extra-load-path '("~/.emacs.d/tree-sitter/"))
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

(use-package highlight-indent-guides
  :ensure t
  :init
  (setq highlight-indent-guides-method 'character)
  :hook (prog-mode . highlight-indent-guides-mode))

(use-package doom-themes
  :ensure t)

(use-package autothemer
  :ensure t)

(use-package zig-ts-mode
  :ensure t)

(use-package github-light-theme
  :ensure t
  :vc (:url "https://github.com/ladroid/github-emacs-theme"))

(use-package rainbow-mode
  :ensure t
  :init
  (setq rainbow-x-colors nil)
  (setq rainbow-html-colors nil)
  :hook (prog-mode . rainbow-mode))

(use-package rainbow-delimiters
  :ensure t
  :hook (emacs-lisp-mode . rainbow-delimiters-mode))

(use-package nix-ts-mode
  :ensure t)

(use-package multiple-cursors
  :ensure t
  :bind ("C-c C-c" . mc/edit-lines))

(use-package ligature
  :ensure t
  :init
  (ligature-set-ligatures '(prog-mode) '("=>"  "->" "<-"
                                         "/="  "==" ">>"
                                         "<<"  ">=" "<="
                                         ".."  "|>" "<|"
                                         ">>=" "=<<"))
  :hook (prog-mode . ligature-mode))

(use-package ansi-color
  :ensure t
  :hook (compilation-filter-hook . ansi-color-compilation-filter))

(use-package ido
  :ensure t)

(use-package smex
  :ensure t
  :init
  (global-set-key (kbd "M-x") 'smex)
  (global-set-key (kbd "M-X") 'smex-major-mode-commands)
  (global-set-key (kbd "C-x M-x") 'execute-extended-command))

(ido-mode)
(smex-initialize)

(load-theme 'bloop-nvim-light)
(global-set-key [remap list-buffers] 'ibuffer)
