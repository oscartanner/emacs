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

;; Set default Python virtualenv on startup
(pyvenv-workon 'py39)
