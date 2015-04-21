;; .emacs for ubuntu
;; usage: sh auto_install.sh

(unless (= emacs-major-version 24)
  (error "Emacs version 24 is required"))


(add-to-list 'load-path "~/.cask")
(require 'cask "~/.cask/cask.el")
(cask-initialize)

(if (file-exists-p "~/work/github/emacs/alpha_emacs/innate/basic.el")
    (load "~/work/github/emacs/alpha_emacs/innate/basic.el"))

;; init the emacs key binding if the file exist that setting the key mapping
(if (file-exists-p "~/work/github/emacs/alpha_emacs/innate/key_binding.el")
    (load "~/work/github/emacs/alpha_emacs/innate/key_binding.el"))


;;
;; add load path which has the elisp file to config my emacs
;; if the alpha_emacs
(add-to-list 'load-path "~/work/github/emacs/alpha_emacs/")
(let ((default-directory "~/work/github/emacs/alpha_emacs"))
     (normal-top-level-add-subdirs-to-load-path))
;;
;; Load the extension configration of emacs
(require 'ext_emacs)

;; load the theme
(require 'alpha_theme)

;;set the chinese environment
;(set-language-environment 'Chinese-GBK)
;(prefer-coding-system 'utf-8)
