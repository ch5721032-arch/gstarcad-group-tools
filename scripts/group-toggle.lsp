;; group-toggle.lsp - Toggle group selection on and off
;; Command: GTOGGLE
(defun c:GTOGGLE ( / ps )
  (setq ps (getvar "PICKSTYLE"))
  (if (= 1 (logand ps 1))
    (setvar "PICKSTYLE" (- ps 1))
    (setvar "PICKSTYLE" (+ ps 1))
  )
  (princ (strcat "\nPICKSTYLE = " (itoa (getvar "PICKSTYLE"))))
  (princ)
)
