;; Remember to run M-x jedi:install-server

(elpy-enable)

(setq python-shell-interpreter "ipython"
      python-shell-interpreter-args "-i --simple-prompt")

;; Enable Flycheck
(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))

;; Enable auto format code on save - autopep8
(require 'py-autopep8)
(add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)

;; Use py-isort on before save hook
(add-to-list 'load-path "~/dev")
(require 'py-isort)
(add-hook 'before-save-hook 'py-isort-before-save)

;; Use py-autoflake to remove unused imports and variables
(load "~/.emacs.d/buftra.el")
(load "~/.emacs.d/py-autoflake.el")
(add-hook 'python-mode-hook 'py-autoflake-enable-on-save)
(setq py-autoflake-options '("--remove-all-unused-imports"))

;; Use importmagic to autoimport missing dependencies
(use-package importmagic
    :ensure t
    :config
    (add-hook 'python-mode-hook 'importmagic-mode))

(setq importmagic-be-quiet t)

;; Enable Web Mode for better HTML editing
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))

;; Set default Python virtualenv on startup
(pyvenv-workon 'py39)
