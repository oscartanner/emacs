(defun set-exec-path-from-shell-PATH ()
  "Set up Emacs' `exec-path' and PATH environment variable to match
that used by the user's shell.

This is particularly useful under Mac OS X and macOS, where GUI
apps are not started from a shell."
  (interactive)
  (let ((path-from-shell (replace-regexp-in-string
			  "[ \t\n]*$" "" (shell-command-to-string
					  "$SHELL --login -c 'echo $PATH'"
						    ))))
    (setenv "PATH" path-from-shell)
    (setq exec-path (split-string path-from-shell path-separator))))

(set-exec-path-from-shell-PATH)

(defun setup-tide-mode ()
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1)
  ;; company is an optional dependency. You have to
  ;; install it separately via package-install
  ;; `M-x package-install [ret] company`
  (company-mode +1))

;; aligns annotation to the right hand side
;; (setq company-tooltip-align-annotations t)

;; formats the buffer before saving
(add-hook 'before-save-hook 'tide-format-before-save)

(add-hook 'typescript-mode-hook #'setup-tide-mode)

(setq tide-format-options '(:insertSpaceAfterFunctionKeywordForAnonymousFunctions t :placeOpenBraceOnNewLineForFunctions nil :indentSize 2 :tabSize 2 :insertSpaceAfterOpeningAndBeforeClosingTemplateStringBraces nil :placeOpenBraceOnNewLineForControlBlocks nil))

(defun my-js-mode-hook ()
  "Custom `js-mode' behaviours."
  (setq indent-tabs-mode nil))

(add-hook 'js-mode-hook 'my-js-mode-hook)

;; File extensions config
;; CSS
(use-package css-mode
  :mode "\\.css$"
  :custom (css-indent-offset 2))
(use-package scss-mode
  :mode ("\\.scss$" "\\.sass$"))

;; JS
(setq-default js-indent-level 4)

;; ;; Typescript
;; (use-package typescript-mode
;;   :mode "\\.tsx?$"
;;   :hook
;;   (typescript-mode . lsp)
;;   :custom
;;   (typescript-indent-level 2))

(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.tsx\\'" . web-mode))
(add-hook 'web-mode-hook
t          (lambda ()
            (when (string-equal "tsx" (file-name-extension buffer-file-name))
              (setup-tide-mode))))
;; enable typescript-tslint checker
(flycheck-add-mode 'typescript-tslint 'web-mode)

;; enable prettier
(add-hook 'after-init-hook #'global-prettier-mode)

;; (provide '04typescript-setup)
;;; 04typescript-setup.el ends here
