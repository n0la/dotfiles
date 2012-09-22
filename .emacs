;; Change default for backspace and help.
;; Emacs does not adhere to the *NIX tradition that C-h is backspace.
(global-set-key [(control h)] 'delete-backward-char)
(global-set-key (kbd "C-?") 'help-command)

(tool-bar-mode -1)
(scroll-bar-mode -1)

(prefer-coding-system       'latin-1)
(set-default-coding-systems 'latin-1)
(set-terminal-coding-system 'latin-1)
;;(set-keyboard-coding-system 'latin-1)
;; This from a japanese individual.  I hope it works.
;;(setq default-buffer-file-coding-system 'utf-8)

(setq tab-stop-list (number-sequence 4 200 4))
(setq line-number-mode t)
(setq column-number-mode t)

;; Backup files are annoying and tabs are evil.
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(indent-tabs-mode nil)
 '(make-backup-files nil)
 '(standard-indent 4)
 '(tab-width 2))

(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "black" :foreground "white" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 120 :width normal :foundry "*" :family "terminus")))))
