;; Custom abbreviations to save some time while typing
;; German texts.

;; (put 'my-after-abbrev-expand 'no-self-insert)

(define-abbrev-table 'german-minor-mode-abbrev-table '(
 ("ae" "ä" 'no-self-insert 0)
 ("Ae" "Ä" 'no-self-insert 0)

 ("oe" "ö" 'no-self-insert 0)
 ("Oe" "Ö" 'no-self-insert 0)

 ("ue", "ü" 'no-self-insert 0)
 ("Ue", "Ü" 'no-self-insert 0)

 ("sz", "ß" 'no-self-insert 0)
))
