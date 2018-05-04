;; package -- Emacs Configuration
;;;
;;; Commentary:
;;; this enables sevaral quirks for the elixir mode
;;;
;;; Code:

(package-initialize)

;; Repositories
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
			 ("marmalade" . "http://marmalade-repo.org/packages/")
			 ("melpa" . "http://melpa.milkbox.net/packages/")))


; list the packages you want
(defvar package-list)
(setq package-list '(json-mode magit textmate smartparens ruby-tools robe rbenv rainbow-mode projectile multiple-cursors grizzl flycheck feature-mode enh-ruby-mode auto-complete markdown-mode))

; activate all the packages (in particular autoloads)
(package-initialize)

; fetch the list of packages available
(unless package-archive-contents
  (package-refresh-contents))

; install the missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

(add-to-list 'load-path "~/.emacs.d/custom")
(load "00common-setup.el")
(load "01ruby-setup.el")
(load "02packages-setup.el")

(provide 'init)
;;; init.el ends here
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(display-time-mode t)
 '(menu-bar-mode nil)
 '(package-selected-packages
   (quote
    (json-mode markdown-mode magit textmate smartparens ruby-tools robe rbenv rainbow-mode projectile multiple-cursors grizzl flycheck feature-mode enh-ruby-mode auto-complete)))
 '(scroll-bar-mode nil)
 '(show-paren-mode t)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
