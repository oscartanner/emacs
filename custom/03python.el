;;; 03python -- Summary
;;; Commentary:
;;; Remember to install all denpendencies in Virtual Env:
;;; pip install autopep8 flake8 jedi yapf black rope virtualenv importmagic epc isort autoflake ipython
;;;  Remember to run M-x jedi:install-server

;; Set default Python virtualenv on startup
(pyvenv-workon 'biller)

(elpy-enable)

;; Elpy will use current enable virtual env
(setq elpy-rpc-virtualenv-path 'current)

(setq python-shell-interpreter "ipython"
      python-shell-interpreter-args "-i --simple-prompt")

;; Enable Flycheck
(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))

;; Use py-isort on before save hook
(add-to-list 'load-path "~/dev")
(require 'py-isort)
(add-hook 'before-save-hook 'py-isort-before-save)

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

(defun my-web-mode-hook ()
  "Hooks for Web mode."
  (setq web-mode-markup-indent-offset 2)
)
(add-hook 'web-mode-hook  'my-web-mode-hook)

;; Remove unused imports on C-c C-i
(load "~/.emacs.d/buftra.el")
(load "~/.emacs.d/py-autoflake.el")
(setq py-autoflake-options '("--remove-all-unused-imports"))

(global-set-key (kbd "C-c C-i") `py-autoflake-buffer)

;; Use Blacken for code formatting
(add-hook 'python-mode-hook 'blacken-mode)

;; Add shortcut to debug snippet
(defun debug-in-python-snippet ()
  (interactive)
  (insert "import pdb; pdb.set_trace()  # fmt: skip"))
(global-set-key (kbd "M-s p") 'debug-in-python-snippet)

(provide '03python)
;;; 03python ends here
