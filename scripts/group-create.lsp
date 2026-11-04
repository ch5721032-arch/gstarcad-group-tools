;; group-create.lsp - Create a named or anonymous group
;; Command: GMAKE
(defun c:GMAKE ( / ss nm )
  (setq ss (ssget "\nSelect objects to group: "))
  (if ss
    (progn
      (setq nm (getstring T "\nGroup name (Enter for anonymous): "))
      (if (= nm "")
        (command "_.GROUP" "_C" "*" "" ss "")
        (command "_.GROUP" "_C" nm "" ss "")
      )
      (princ "\nGroup created.")
    )
  )
  (princ)
)
