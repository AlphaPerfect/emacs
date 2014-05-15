; ru nshell
(global-set-key (kbd "C-c z") (quote shell))

;ibuffer Mode;
; http://www.emacswiki.org/emacs/IbufferMode
(global-set-key (kbd "C-x C-b") 'ibuffer)
(autoload 'ibuffer "ibuffer" "List buffers." t)

; move to other window
(global-set-key (kbd "C-O") 'other-window)

; buffer move
(global-set-key (kbd "M-P") 'previous-buffer)
(global-set-key (kbd "M-N") 'next-buffer)

; key binding for rename buffer
(global-set-key (kbd "C-x M-s") 'rename-buffer)

; window move key setting
;(define-prefix-command 'ctl-w-map)
;(global-set-key (kbd "C-w ") 'ctl-w-map)
;(global-set-key (kbd "C-w h") 'windmove-left)
;(global-set-key (kbd "C-w l") 'windmove-right)
;(global-set-key (kbd "C-w k") 'windmove-up)
;(global-set-key (kbd "C-w j") 'windmove-down)

;(global-set-key [M-left] 'windmove-left)        ; move to left windnow
;(global-set-key [M-right] 'windmove-right)      ; move to right window
;(global-set-key [M-up] 'windmove-up)            ; move to upper window
;(global-set-key [M-down] 'windmove-down)        ; move to downer window


;(global-set-key [(control N)] 'other-window-move-down)
;(global-set-key [(control P)] 'other-window-move-up)
