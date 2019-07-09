;; Remember to run M-x jedi:install-server

(elpy-enable)

(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)

(defun my/python-mode-hook ()
   (add-to-list 'company-backends 'company-jedi))

(add-hook 'python-mode-hook 'my/python-mode-hook)

;; Auto identation
(require 'py-autopep8)
(add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)
