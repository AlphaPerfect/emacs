(add-to-list 'load-path "company-mode")
(require 'company)
;(add-hook 'prog-mode-hook 'global-company-mode)
(add-hook 'after-init-hook 'global-company-mode)
;; does not matter, I never use this hotkey
(global-set-key (kbd "C-c o") 'company-complete)
;(global-set-key [(control tab)] 'company-complete)
;(setq company-auto-complete t)
(setq company-idle-delay nil)
(setq company-require-match nil)

(if (fboundp 'evil-declare-change-repeat)
    (mapc #'evil-declare-change-repeat
          '(company-complete-common
            company-select-next
            company-select-previous
            company-complete-selection
            )))

(eval-after-load 'company
  '(progn
     (add-to-list 'company-backends 'company-cmake)
     ;; can't work with TRAMP
     (setq company-backends (delete 'company-ropemacs company-backends))
     (setq company-backends (delete 'company-capf company-backends))
     ;; I don't like the downcase word in company-dabbrev
     ;; for languages use camel case naming convention
     (setq company-dabbrev-downcase nil)
     (setq company-show-numbers t)
     (setq company-begin-commands '(self-insert-command))
     (setq company-idle-delay 0.2)
     (setq company-clang-insert-arguments nil)
     ))

(provide 'init-company)
