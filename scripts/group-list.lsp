;; group-list.lsp - Count every group in the drawing
;; Command: GLIST
(defun c:GLIST ( / grp lst n )
  (setq grp (dictsearch (namedobjdict) "ACAD_GROUP"))
  (if grp
    (progn
      (setq lst grp n 0)
      (while lst
        (if (= 350 (caar lst)) (setq n (1+ n)))
        (setq lst (cdr lst))
      )
      (princ (strcat "\nGroups in drawing: " (itoa n)))
    )
    (princ "\nNo groups found.")
  )
  (princ)
)
