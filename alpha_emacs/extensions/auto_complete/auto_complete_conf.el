(add-to-list 'load-path "~/.emacs.d/lisp")
;(require 'auto-complete-autoloads)
(require 'auto-complete-config)
(require 'go-autocomplete)

;; jedit config
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)
;(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(ac-config-default)
