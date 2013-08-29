;; .emacs for mozilla_build1.4 on windows
;;  copy this file to ~/.emacs
;;

;; See cedet/common/cedet.info for configuration details.
;(add-to-list 'load-path "~/elisp/emacs/cedet")
(load-file "/d/PortableApp/emacs/cedet-1.1/common/cedet.el")
;(require 'cedet)
;(require 'semantic-ia)
;(semantic-load-enable-minimum-features)
;(semantic-load-enable-code-helpers)
;(semantic-load-enable-guady-code-helpers)
;(semantic-load-enable-excessive-code-helpers)
;(semantic-load-enable-semantic-debugging-helpers)



;;add the cscope-install-directory to the load-path
;if the emacs don't have the xscope.el the add the load-path contained it
(add-to-list 'load-path "~/elisp/emacs/cscope/cscope-15.7-win")
(require 'xcscope)

;;Muse load-path
(add-to-list 'load-path "~/elisp/emacs/muse-latest/lisp")
;(require 'muse-color)
(require 'muse-mode)
(require 'muse-html)   
(require 'muse-latex)
(require 'muse-texinfo)
(require 'muse-wiki)
(require 'muse-docbook)
(require 'muse-project)  ; publish files in projects

;;the muse project setting
(setq muse-project-alist
      '(("algorithms" ("/d/Study/algorithms-dream/doc" :default "index")
         (:base "html" :path "/d/Study/algorithms-dream/doc/public_html")
         (:base "pdf" :path "/d/Study/algorithms-dream/doc/public_pdf"))))


;;some elisp file follow
(add-to-list 'load-path "~/elisp/emacs/emcex")
;; Load the real .emacs
(load-file "~/elisp/emacs/emacs_public")

;;set the auto-install
;(add-to-list 'load-path (expand-file-name "./emecx"))
;(add-to-list 'load-path (expand-file-name "~/elisp/emacs/emecx"))
;(require 'auto-install)
;(setq auto-install-directory "~/.emacs.d/auto-install/")
;;Optionally load the Emacswiki package list at startup
;;if you set it, it will update the list of package names 
;;from Emacswiki when Emacs starts up
;(auto-install-update-emacswiki-package-name t)
;;If you want to use proxy server, set ‘url-proxy-services’.
;For example:;(setq url-proxy-services '(("http" . "localhost:8339")))


;;set default font added by mlf reference g9's blog 
;;Options --> Set Default Font
;;M-x:describe-font
;;copy the font name in herr to set windows default-font
(set-default-font "-outline-bitstream vera sans mono-normal-r-normal-normal-13-90-96-96-c-*-fontset-auto1")
;(set-default-font "-bitstream-Bitstream Vera Sans Mono-normal-normal-normal-*-13-*-*-*-m-0-iso10646-1")

;;set easypg to secruit the diary
;(require 'epa-file) 
;(epa-file-enable)

(require 'multi-term)
(setq multi-term-program "/bin/bash")

;(put 'scroll-left 'disabled nil)

;; Load the auto-complete settings
(add-to-list 'load-path "~/elisp/emacs/emcex/auto-complete")
(load-file "~/elisp/emacs/emcex/auto-complete-settings.el")
;(load-file "~/elisp/emacs/emcex/init-auto-complete.el")
;(require 'init-auto-complete)
;(require 'auto-complete)
;(require 'auto-complete-config)
;(global-auto-complete-mode t)
;(setq-default ac-sources '(ac-source-words-in-same-mode-buffers))
;(add-hook 'emacs-lisp-mode-hook (lambda () (add-to-list 'ac-sources 'ac-source-symbols)))
;(add-hook 'auto-complete-mode-hook (lambda () (add-to-list 'ac-sources 'ac-source-filename)))
;(set-face-background 'ac-candidate-face "lightgray")
;(set-face-underline 'ac-candidate-face "darkgray")
;(set-face-background 'ac-selection-face "steelblue") ; set the color
;(define-key ac-completing-map "\M-n" 'ac-next)  ;;; through M-n iterate the list
;(define-key ac-completing-map "\M-p" 'ac-previous)
;(setq ac-auto-start 2)
;(setq ac-dwim t)
;(define-key ac-mode-map (kbd "M-TAB") 'auto-complete)

;; UTF-8 settings
(set-language-environment "UTF-8")
;(set-terminal-coding-system 'utf-8)
;(set-keyboard-coding-system 'utf-8)
;(set-clipboard-coding-system 'utf-8)
;(set-buffer-file-coding-system 'utf-8)
;(set-selection-coding-system 'utf-8)
;(modify-coding-system-alist 'process "*" 'utf-8)

;;Emacs23 for windows 7 字体设置
(setq w32-charset-info-alist
(cons '("gbk" w32-charset-gb2313 . 936) w32-charset-info-alist))
(setq default-frame-alist
(append
'((font . "fontset-gbk")) default-frame-alist))
(create-fontset-from-fontset-spec
"-outline-Courier New-normal-r-normal-normal-13-97-96-96-c-*-fontset-gbk")
(set-fontset-font
"fontset-default" nil
"-outline-新宋体-normal-r-normal-*-13-*-96-96-c-*-iso10646-1" nil 'prepend)
(set-fontset-font
"fontset-gbk" 'kana
"-outline-新宋体 -normal-r-normal-*-13-*-96-96-c-*-iso10646-1" nil 'prepend)
(set-fontset-font
"fontset-gbk" 'han
"-outline-新宋体-normal-r-normal-*-13-*-96-96-c-*-iso10646-1" nil 'prepend)
(set-fontset-font
"fontset-gbk" 'cjk-misc
"-outline-新宋体-normal-r-normal-*-13-*-96-96-c-*-iso10646-1" nil 'prepend)
(set-fontset-font
"fontset-gbk" 'symbol
"-outline-新宋体-normal-r-normal-*-13-*-96-96-c-*-iso10646-1" nil 'prepend)
(set-default-font "fontset-gbk")


;;; slime configuration
;(add-to-list 'load-path "~/elisp/emacs/emcex/slime/")  ; your SLIME directory
; your Lisp system setting on different platform, check the linux or mozilla-build config
;(setq inferior-lisp-program "/d/PortableApp/emacs/ccl-1.6-windowsx86/wx86cl.exe") ; your Lisp system compiler
;;(setq inferior-lisp-program "/opt/sbcl/bin/sbcl") 
;;(require 'slime)
;; load when need by M-x(slime)
;(require 'slime-autoloads)
;(slime-setup '(slime-fancy))
