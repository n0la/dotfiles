;; Change default for backspace and help.
;; Emacs does not adhere to the *NIX tradition that C-h is backspace.
(global-set-key [(control h)] 'delete-backward-char)
(global-set-key (kbd "C-?") 'help-command)

;; Backup files are annoying and tabs are evil.
(custom-set-variables
 '(indent-tabs-mode nil)
 '(make-backup-files nil))

