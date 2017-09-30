;; Enable full screen on open (another desktop)
(add-to-list 'default-frame-alist '(fullscreen . maximized))

;; Enable line numbers globally
(global-linum-mode t)

;; Enable column number mode
(column-number-mode 1)

;; Set default font-size
(set-face-attribute 'default nil :height 110)

;; Fix for accented characters
(require 'iso-transl)

;; display time in status bar
(display-time)

;; Changes all yes/no questions to y/n type
(fset 'yes-or-no-p 'y-or-n-p)

;; Activates delete selection mode
(delete-selection-mode 1)

;; Backup settings
(setq backup-directory-alist `(("." . "~/.emacs.d/backups")))

(tool-bar-mode nil)
(menu-bar-mode nil)

(load-theme `tango-dark)

;; Toggle the option key as meta - made by Me :)
(set-cursor-color "#f8f515") ; Sets the cursor initial color

(global-set-key (kbd "C-;") `tf-toggle-option-as-meta)

(defun tf-toggle-option-as-meta ()
  "Toogle meta key."
  (interactive)
  (if (null mac-option-modifier)
      (progn
	(message "Alt is meta")
	(set-cursor-color "#f8f515")
	(setq mac-option-modifier `meta))
    (progn
      (message "Alt is not meta")
      (set-cursor-color "#42dd1d")
      (setq mac-option-modifier nil)))
  )

;; Highlight matching parentheses
(show-paren-mode 1)

;; inhibit-startup-screen
(setq inhibit-startup-screen t)

;; Flycheck
(add-hook 'after-init-hook #'global-flycheck-mode)

;; set up unicode
(prefer-coding-system       'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(setq default-buffer-file-coding-system 'utf-8)
(setq x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING))

;; Used mainly to hide menu and scroll bars
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(display-time-mode t)
 '(menu-bar-mode nil)
 '(scroll-bar-mode nil)
 '(show-paren-mode t)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
