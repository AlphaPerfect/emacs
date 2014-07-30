; configration of the extensions in extensions directory
(provide 'ext_emacs)

; ELPA, Emacs lisp Package Archive
;; repository setting: http://emacswiki.org/emacs/ELPA
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                        ("marmalade" . "http://marmalade-repo.org/packages/")
                        ("melpa" . "http://melpa.milkbox.net/packages/")))

; language
(add-to-list 'load-path "language")

;; scheme mode
(autoload 'paredit-mode "paredit"
  "Minor mode for pseudo-structurally editing Lisp code."  t)

;; go mode
(require 'go-mode)
(require 'go-mode-load)

;; php mode
(require 'php-mode)
; shell directory
;(add-to-list 'load-path "shell")
;(if (file-exists-p "~/work/ggcode/elisp/alpha_emacs/extensions/shell/shell_conf.el")
;    (load "~/work/ggcode/elisp/alpha_emacs/extensions/shell/shell_conf.el"))

; auto-complete config
;(add-to-list 'load-path "auto_complete")
;(if (file-exists-p "~/work/github/emacs/alpha_emacs/extensions/auto_complete/auto_complete_conf.el")
;    (load "~/work/github/emacs/alpha_emacs/extensions/auto_complete/auto_complete_conf.el"))

(require 'xcscope)

;; markdown-mode
(autoload 'markdown-mode "markdown-mode"
  "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

;; objective-c mode
(add-to-list 'auto-mode-alist '("\\.m\\'" . objc-mode))
(add-to-list 'auto-mode-alist '("\\.mm\\'" . objc-mode))
(add-to-list 'magic-mode-alist
                `(,(lambda ()
                     (and (string= (file-name-extension buffer-file-name) "h")
                          (re-search-forward "@\\<interface\\>"
                                                  magic-mode-regexp-match-limit t)))
                  . objc-mode))
