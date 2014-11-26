;; the org log settng
(setq org-log-done 'time)

;; replace the less for PAGER by cat
(setenv "PAGER" "/bin/cat")

;; ido package: lets you interactively do things with buffers and files.
; http://emacswiki.org/emacs/InteractivelyDoThings
(require 'ido)
(ido-mode t)

;;http://emacswiki.org/emacs/IswitchBuffers
;(iswitchb-mode 1)

;; uncomment this line to disable loading of "default.el" at startup
(setq inhibit-default-init t)

;;no startup message added
(setq inhibit-startup-message t)

;; turn off the menu-bar
(menu-bar-mode -1)

;; turn off the tool bar
;(tool-bar-mode -1)

;; disable the bell when error, added by mlf
(setq visible-bell t)

;; replace yes-or-no-p to y-or-n-p added by mlf
(fset 'yes-or-no-p 'y-or-n-p)

;;(display-time-mode 1)
(display-time)
;;use the 24hour format
(setq display-time-24hr-format t)
;; display time and date
(setq display-time-day-and-date t)

;;display column-number
(setq column-number-mode t)

;(setq line-number-mode t)
;;(require 'linum)
;;(global-linum-mode t)

;;set major mode to text-mode
(setq default-major-mode 'text-mode)

;; set tab function added by mlf
(setq-default indent-tabs-mode nil)
    (setq default-tab-width 4)
    (setq tab-stop-list ())
;;(loop for x downfrom 40 to 1 do
;;(setq tab-stop-list (cons (* x 4) tab-stop-list)))

;;set display parentheses not jump the position by mlf
(show-paren-mode t)
(setq show-paren-style 'parenthesis)

;;set display the name of buffer by mlf
(setq frame-title-format "emacs@%b")

; auto backup files setting
(setq backup-by-copying t
      backup-directory-alist
      '(("." . "~/.emacs_saves"))
      delete-old-versions t
      kept-new-versions 6
      kept-old-versions 2
      version-control t)


;;matching paren function added by mlf
(global-set-key "%" 'match-paren)
(defun match-paren (arg)
    "Go to the matching paren if on a paren; otherwise insert %."
    (interactive "p")
    (cond ((looking-at "\\s\(") (forward-list 1) (backward-char 1))
        ((looking-at "\\s\)") (forward-char 1) (backward-list 1))
        (t (self-insert-command (or arg 1)))))

;;go the char like fx ; command in vi
(defun wy-go-to-char (n char)
   "Move forward to Nth occurence of CHAR.
   Typing `wy-go-to-char-key' again will move forwad to the next Nth
   occurence of CHAR."
     (interactive "p\ncGo to char: ")
     (search-forward (string char) nil nil n)
     (while (char-equal (read-char)
                             char)
        (search-forward (string char) nil nil n))
     (setq unread-command-events (list last-input-event)))

(define-key global-map (kbd "C-x j") 'wy-go-to-char)

;; add the hook to delete the trailing whitespace when save file
(add-hook 'write-file-hooks 'delete-trailing-whitespace)

;; define the function to refresh the file from disk
(defun refresh-file ()
  (interactive)
  (revert-buffer t (not (buffer-modified-p)) t))

(global-set-key [(f5)] 'refresh-file)
