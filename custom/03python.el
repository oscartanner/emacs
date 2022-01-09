;; Remember to run M-x jedi:install-server

(elpy-enable)
;; (pyenv-mode)

(setq python-shell-interpreter "ipython"
      python-shell-interpreter-args "-i --simple-prompt")

;; Enable Flycheck
(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))

;; Enable auto format code on save - autopep8
(require 'py-autopep8)
(add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)

;; Autocomplete company-jedi
;; (defun my/python-mode-hook ()
  ;; (add-to-list 'company-backends 'company-jedi))

;; (add-hook 'python-mode-hook 'my/python-mode-hook)

;; Set default Python virtualenv on startup
(pyvenv-workon 'py39)
