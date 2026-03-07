;;; Editing defaults
(setq-default indent-tabs-mode nil)
(setq tab-width 2)
(fset 'yes-or-no-p 'y-or-n-p)
(add-hook 'before-save-hook 'delete-trailing-whitespace)
(setq show-trailing-whitespace t)

;;; Backups — keep them out of the working tree
(setq backup-by-copying t
      backup-directory-alist '(("." . "~/.emacs.d/backups"))
      delete-old-versions t
      kept-new-versions 6
      kept-old-versions 2
      version-control t)

;;; UI — minimal chrome
(menu-bar-mode -1)
(when (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(when (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(setq inhibit-startup-screen t)

;;; Display
(global-display-line-numbers-mode 1)
(column-number-mode 1)
(show-paren-mode 1)
(global-font-lock-mode 1)
(save-place-mode 1)

;;; Navigation
(ido-mode 1)
(setq ido-enable-flex-matching t)

;;; Theme — dark to match tmux
(load-theme 'wombat t)
