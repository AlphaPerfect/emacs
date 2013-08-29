;;
;; some extend elisp file directory 
;;(add-to-list 'load-path "~/elisp/alpha_emacs/emcex")
;; Load the real .emacs
;;(load-file "~/elisp/emacs/emacs_public")

;; See cedet/common/cedet.info for configuration details.
;; this is obsoleted on 23.2 version of emacs
;(load-file "~/cedet-VERSION/common/cedet.el")
;(load-file "~/Tools/sourceRead/cedet-1.0pre6/common/cedet.el")
;;load the configration of cedet which made by Edward Meng
;(load-file "~/elisp/emacs/emcex/em-cedet.el")

;;MUST add the ECB-install-directory to the load-path
;(add-to-list 'load-path "~/Tools/sourceRead/ecb-2.40")
;(require 'ecb)

;;add the cscope-install-directory to the load-path
;;(add-to-list 'load-path "~/Tools/sourceRead/cscope-15.7a/contrib/xcscope")
;;(require 'xcscope)

;;Muse load-path
;;(add-to-list 'load-path "~/Tools/Writing/EmacsMuse/museInstall/muse")
;(require 'muse-color)  
;(require 'muse-mode)
;(require 'muse-html)   
;(require 'muse-latex)
;(require 'muse-texinfo)
;(require 'muse-wiki)
;(require 'muse-docbook)
;(require 'muse-project)  ; publish files in projects


;;set the chinese environment
;(set-language-environment 'Chinese-GBK)
;(prefer-coding-system 'utf-8)

;;Optionally load the Emacswiki package list at startup
;;if you set it, it will update the list of package names 
;;from Emacswiki when Emacs starts up
;(auto-install-update-emacswiki-package-name t)
;;If you want to use proxy server, set ĄŽurl-proxy-servicesĄŻ.
;For example:;(setq url-proxy-services '(("http" . "localhost:8339")))

;;copy the font name in here to set linux default-font
;(set-default-font "-bitstream-Bitstream Vera Sans Mono-normal-normal-normal-*-14-*-*-*-m-0-iso10646-1")

;;set easypg to secruit the diary
;(require 'epa-file) 
;(epa-file-enable)

;;; multi-term
(require 'multi-term)
(setq multi-term-program "/bin/bash")

;; auto-install configration
;(require 'auto-install)
;(setq auto-install-directory "~/elisp/emacs/emcex/auto-install/")

