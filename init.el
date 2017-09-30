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

(add-to-list 'load-path "~/.emacs.d/custom")
(load "00common-setup.el")
(load "01ruby-setup.el")
(load "02packages-setup.el")

(require 'auto-complete)
(global-auto-complete-mode t)

(provide 'init)
;;; init.el ends here
