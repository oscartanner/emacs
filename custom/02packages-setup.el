;; Auto complete
(require 'auto-complete)
(global-auto-complete-mode t)

(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories
	     "~/.emacs.d/elpa/auto-complete-20170124.1845/dict/")
(ac-config-default)
(setq ac-ignore-case nil)
(add-to-list 'ac-modes 'enh-ruby-mode)

;; IDO mode
(setq ido-enable-flex-matching nil)
(setq ido-create-new-buffer 'always)
(setq ido-everywhere t)
(ido-mode 1)

;; Smart Parens
(require 'smartparens-config)
(require 'smartparens-ruby)
(smartparens-global-mode)
(show-smartparens-global-mode t)
(sp-with-modes '(rhtml-mode)
  (sp-local-pair "<" ">"))

;; Projectile Mode
;; (require 'grizzl)
(projectile-global-mode +1)
(setq projectile-enable-caching t)
(define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
(setq projectile-project-search-path '("~/dev/"))

;; Rainbow mode
(require 'rainbow-mode)
(add-hook 'clevercss-mode-hook 'rainbow-mode)
(add-hook 'less-mode-hook 'rainbow-mode)
(add-hook 'css-mode-hook 'rainbow-mode)

;; Multiple Cursors mode
(require 'multiple-cursors)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

(provide '02packages-setup)
;;; 02packages-setup.el ends here
