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

; shell directory
(add-to-list 'load-path "shell")
(if (file-exists-p "~/work/ggcode/elisp/alpha_emacs/extensions/shell/shell_conf.el") 
    (load "~/work/ggcode/elisp/alpha_emacs/extensions/shell/shell_conf.el"))

; auto-complete config
(add-to-list 'load-path "auto_complete")
(if (file-exists-p "~/work/ggcode/elisp/alpha_emacs/extensions/auto_complete/auto_complete_conf.el") 
    (load "~/work/ggcode/elisp/alpha_emacs/extensions/auto_complete/auto_complete_conf.el"))

(require 'xcscope)


(autoload 'markdown-mode "markdown-mode"
  "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
