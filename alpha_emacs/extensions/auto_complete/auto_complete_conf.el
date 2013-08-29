;;popup
(add-to-list 'load-path "~/.emacs.d/elpa/popup-20121020.1203") 
(require 'popup-autoloads)
;; auto_complete
; This may not be appeared if you have already added.
(add-to-list 'load-path "~/.emacs.d/elpa/auto-complete-20121022.2254") 
;(require 'auto-complete-autoloads)
(require 'go-autocomplete)
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/elpa/auto-complete-20121022.2254/dict")
(ac-config-default)
