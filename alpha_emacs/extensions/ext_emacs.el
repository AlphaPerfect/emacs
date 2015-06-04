; configration of the extensions in extensions directory
(provide 'ext_emacs)

; ELPA, Emacs lisp Package Archive
;; repository setting: http://emacswiki.org/emacs/ELPA
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                        ("marmalade" . "http://marmalade-repo.org/packages/")
                        ("melpa" . "http://melpa.milkbox.net/packages/")))

; language
(add-to-list 'load-path "language")

;;set c++ style as stroustrup style
;(add-hook 'c++-mode-hook
; '(lambda()
;  (c-set-style "stroustrup")))

;; google c++ style
(require 'google-c-style)
(add-hook 'c-mode-common-hook 'google-set-c-style)
;; google return key to go to the next line and space over to the right place
(add-hook 'c-mode-common-hook 'google-make-newline-indent)

(defun cpplint ()
  "check source code format according to Google Style Guide"
  (interactive)
  (compilation-start (concat "python ~/work/github/emacs/alpha_emacs/extensions/language/cpplint.py " (buffer-file-name))))

;; scheme mode
(autoload 'paredit-mode "paredit"
  "Minor mode for pseudo-structurally editing Lisp code."  t)

;; go mode
(require 'go-mode)
(require 'go-mode-load)
(add-hook 'before-save-hook 'gofmt-before-save)
;; php mode
(require 'php-mode)
; shell directory
;(add-to-list 'load-path "shell")
;(if (file-exists-p "~/work/ggcode/elisp/alpha_emacs/extensions/shell/shell_conf.el")
;    (load "~/work/ggcode/elisp/alpha_emacs/extensions/shell/shell_conf.el"))

; auto-complete config
(add-to-list 'load-path "auto_complete")
(if (file-exists-p "~/work/github/emacs/alpha_emacs/extensions/auto_complete/auto_complete_conf.el")
    (load "~/work/github/emacs/alpha_emacs/extensions/auto_complete/auto_complete_conf.el"))


;; xcscope
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

;;;; init the smex
(autoload 'smex "smex" nil t)
;; (smex-initialize) ; Can be omitted. This might cause a (minimal) delay
; when Smex is auto-initialized on its first run.
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)


;; load yasnippet
(add-to-list 'load-path "yasnippet")
;(require 'init-yasnippet)

;;; load company setting
;(require 'init-company)


;; add window extension directory
(add-to-list 'load-path "window")
(require 'window-numbering)
(custom-set-faces '(window-numbering-face ((t (:foreground "DeepPink" :underline "DeepPink" :weight bold)))))
(window-numbering-mode 1)

;; buffer-move.el
(require 'buffer-move)
(global-set-key (kbd "C-c C-b C-k") 'buf-move-up)
(global-set-key (kbd "C-c C-b C-j") 'buf-move-down)
(global-set-key (kbd "C-c C-b C-h") 'buf-move-left)
(global-set-key (kbd "C-c C-b C-l") 'buf-move-right)
(global-set-key (kbd "<C-S-up>")     'buf-move-up)
; (global-set-key (kbd "<C-S-down>")   'buf-move-down)
; (global-set-key (kbd "<C-S-left>")   'buf-move-left)
; (global-set-key (kbd "<C-S-right>")  'buf-move-right)

;; undo-tree
(add-to-list 'load-path "~/work/github/emacs/alpha_emacs/extensions/evil/lib")
(require 'undo-tree)
(global-undo-tree-mode 1)

;; evil mode
(require 'evil)
(evil-mode 1)
(add-hook 'evil-insert-state-entry-hook 'evil-emacs-state)
(define-key evil-emacs-state-map (kbd "C-[") 'evil-normal-state)
(define-key evil-visual-state-map (kbd "i") 'evil-emacs-state)

;; key-chord is used by evil-escape
;; wget https://raw.githubusercontent.com/redguardtoo/emacs.d/master/site-lisp/key-chord/key-chord.el
(require 'key-chord)
(key-chord-mode 1)
(setq key-chord-two-keys-delay 0.2)
(key-chord-define evil-insert-state-map "jk" 'evil-normal-state)
(key-chord-define evil-emacs-state-map "jk" 'evil-normal-state)
(key-chord-define evil-insert-state-map "jj" 'evil-normal-state)
(key-chord-define evil-emacs-state-map "jj" 'evil-normal-state)

;; {{ https://github.com/syl20bnr/evil-escape
;(require 'evil-escape)
;(evil-escape-mode 1)
;; }}

;; web mode
;;http://web-mode.org/
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\'" . web-mode))

;; {{ evil-leader config
(add-to-list 'load-path "~/work/github/emacs/alpha_emacs/extensions/evil_ext")
(setq evil-leader/leader ",")
(require 'evil-leader)
(evil-leader/set-key
  "ae" 'evil-ace-jump-word-mode ; ,e for Ace Jump (word)
  "al" 'evil-ace-jump-line-mode ; ,l for Ace Jump (line)
  "ac" 'evil-ace-jump-char-mode ; ,x for Ace Jump (char)
  "as" 'ack-same
  "ac" 'ack
  "aa" 'ack-find-same-file
  "af" 'ack-find-file
  "bf" 'beginning-of-defun
  "bu" 'backward-up-list
  "bb" '(lambda () (interactive) (switch-to-buffer nil))
  "ef" 'end-of-defun
  "db" 'sdcv-search-pointer ;; in another buffer
  "dt" 'sdcv-search-input+ ;; in tip
  "mf" 'mark-defun
  "0" 'select-window-0
  "1" 'select-window-1
  "2" 'select-window-2
  "3" 'select-window-3
  "4" 'select-window-4
  "5" 'select-window-5
  "6" 'select-window-6
  "7" 'select-window-7
  "8" 'select-window-8
  "9" 'select-window-9
  "xm" 'smex
  "mx" 'helm-M-x
  "xx" 'er/expand-region
  "xf" 'ido-find-file
  "xb" 'ido-switch-buffer
)

(global-evil-leader-mode)
