;; package -- Emacs Configuration
;;;
;;; Commentary:
;;; this enables sevaral quirks for the elixir mode
;;;
;;; Code:


;;; REMEBER to Run M-x all-the-icons-install-fonts

(package-initialize)

;; Repositories
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)

;; When machine is new, please run
;; M-x package-refresh-contents RET
;; Restart emacs

; list the packages you want
(defvar package-list)
(setq package-list '(json-mode magit smartparens ruby-tools robe rbenv rainbow-mode projectile multiple-cursors grizzl flycheck feature-mode enh-ruby-mode auto-complete markdown-mode go-projectile gotest company company-go pandoc-mode exec-path-from-shell doom-modeline doom-themes yaml-mode dockerfile-mode tide groovy-mode use-package protobuf-mode))

; activate all the packages (in particular autoloads)
(package-initialize)

; fetch the list of packages available
(unless package-archive-contents
  (package-refresh-contents))

; install the missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

(require 'package)
(require 'use-package)

(add-to-list 'load-path "~/.emacs.d/custom")
(load "00common-setup.el")
(load "01ruby-setup.el")
(load "02packages-setup.el")
;; (load "03go-setup.el")
(load "04typescript-setup.el")
;;(load "05scala_setup.el")
;;(load "06python.el")

(provide 'init)
;;; init.el ends here
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(display-time-mode t)
 '(markdown-command "/usr/local/bin/pandoc")
 '(menu-bar-mode nil)
 '(package-selected-packages
   (quote
    (py-autopep8 elpy company-jedi python-mode groovy-mode tide dockerfile-mode yaml-mode doom-themes doom-modeline exec-path-from-shell pandoc-mode json-mode markdown-mode magit smartparens ruby-tools robe rbenv rainbow-mode projectile multiple-cursors grizzl flycheck feature-mode enh-ruby-mode auto-complete use-package protobuf-mode)))
 '(scroll-bar-mode nil)
 '(show-paren-mode t)
 '(tool-bar-mode nil)
 '(typescript-indent-level 2))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'downcase-region 'disabled nil)
