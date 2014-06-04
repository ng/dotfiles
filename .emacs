(setq
   show-trailing-whitespace t   ; show trailing whitespace
   backup-by-copying t          ; don't clobber symlinks
   backup-directory-alist
    '(("." . "~/.saves"))       ; don't litter my fs tree
   delete-old-versions t
   kept-new-versions 6
   kept-old-versions 2
   version-control t)           ; use versioned backups

(ido-mode 1)
(fset 'yes-or-no-p 'y-or-n-p)
(add-hook 'before-save-hook 'delete-trailing-whitespace)
(setq-default indent-tabs-mode nil)
(setq tab-width 2)

