;;; REMEBER to Run M-x all-the-icons-install-fonts

;; Enable full screen on open (another desktop)
(add-to-list 'default-frame-alist '(fullscreen . maximized))

;; Enable line numbers globally
(global-display-line-numbers-mode)

;; Enable column number mode
(column-number-mode 1)

;; Set default font-size
(set-face-attribute 'default nil :height 140)

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

;; Set Find File default start path
(setq default-directory "~/")

;; Themes Configuration
(require 'doom-themes)

;; Global settings (defaults)
(setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
      doom-themes-enable-italic t) ; if nil, italics is universally disabled

;; Load the theme (doom-one, doom-molokai, etc); keep in mind that each theme
;; may have their own settings.
(load-theme 'doom-dark+ t)

;; Enable flashing mode-line on errors
(doom-themes-visual-bell-config)

;; Enable custom neotree theme (all-the-icons must be installed!)
(doom-themes-neotree-config)
;; or for treemacs users
(doom-themes-treemacs-config)

;; Corrects (and improves) org-mode's native fontification.
(doom-themes-org-config)

;; Toggle the option key as meta - made by Me :)
(global-set-key (kbd "C-;") `tf-toggle-option-as-meta)

(defun tf-toggle-option-as-meta ()
  "Toogle meta key."
  (interactive)
  (if (null mac-option-modifier)
      (progn
	(message "Alt is meta")
	(set-cursor-color "#237AD3")
	(setq mac-option-modifier `meta))
    (progn
      (message "Alt is not meta")
      (set-cursor-color "#42dd1d")
      (setq mac-option-modifier nil)))
  )

;; Comment and uncomment line or region of the code
(defun comment-or-uncomment-line-or-region ()
  "Comments or uncomments the current line or region."
  (interactive)
  (if (region-active-p)
      (comment-or-uncomment-region (region-beginning) (region-end))
    (comment-or-uncomment-region (line-beginning-position) (line-end-position))
    )
  )
(global-set-key (kbd "s-/") 'comment-or-uncomment-line-or-region)

;; Add keyboard shortcut for M-x find-grep-dired
(global-set-key (kbd "M-s s") 'find-grep-dired)

;; Highlight matching parentheses
(show-paren-mode 1)

;; inhibit-startup-screen
(setq inhibit-startup-screen t)

;; Flycheck
(dolist (hook '(text-mode-hook))
  (add-hook hook (lambda () (flyspell-mode 1))))

(eval-after-load "flyspell"
  '(progn
     (define-key flyspell-mouse-map [down-mouse-3] #'flyspell-correct-word)
     (define-key flyspell-mouse-map [mouse-3] #'undefined)))

;; Spell check
(setq ispell-program-name "/usr/local/bin/ispell")

;; Pandoc-mode for markdown
(add-hook 'markdown-mode-hook 'pandoc-mode)

;; doom-modeline-init
(require 'doom-modeline)
(doom-modeline-mode 1)

;; set up unicode
(prefer-coding-system       'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(setq default-buffer-file-coding-system 'utf-8)
(setq x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING))

;; Enables Company mode for all buffers
(add-hook 'after-init-hook 'global-company-mode)

;; Trigger completion immediately.
(setq company-idle-delay 0)

;; Number the candidates (use M-1, M-2 etc to select completions).
(setq company-show-numbers t)

;; Use spaces instead of tabs
(setq-default indent-tabs-mode nil)

;; (require 'company-tabnine)

;; (add-to-list 'company-backends #'company-tabnine)

;; Run M-x company-tabnine-install-binary to install the TabNine binary for your system.

;; Add homebrew bin path to Emacs exec-path
(setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin/"))
(setq exec-path (append exec-path '("/usr/local/bin/")))

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
