;; Change default for backspace and help.
;; Emacs does not adhere to the *NIX tradition that C-h is backspace.
(global-set-key [(control h)] 'delete-backward-char)
(global-set-key (kbd "C-?") 'help-command)

(setq tab-stop-list (number-sequence 4 200 4))

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
 )
