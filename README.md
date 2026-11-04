# GstarCAD Group Tools

Create a named or anonymous group, toggle group selection on and off, and count every group in the drawing.

Works with **GSTARCAD**, AutoCAD, ZWCAD, and BricsCAD.

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

## Contents

- [About](#about)
- [Scripts Overview](#scripts-overview)
- [Quick Start](#quick-start)
- [Compatibility](#compatibility)
- [Contributing](#contributing)
- [License](#license)

## About

Groups turn a loose set of objects into something you can pick and move as one. These commands create a named or anonymous group in one step, toggle the group-selection behavior with a single command, and count how many groups already exist in the drawing.

Everything here is free to use with GstarCAD. Download the latest GstarCAD
release from the [official GstarCAD website](https://www.gstarcad.net). All
scripts are tested with **[GSTARCAD](https://www.gstarcad.net)** and major
DWG-based CAD platforms.

## Scripts Overview

| File | Description |
|------|-------------|
| `scripts/group-create.lsp` | ;; group-create.lsp - Create a named or anonymous group
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
 |
| `scripts/group-toggle.lsp` | ;; group-toggle.lsp - Toggle group selection on and off
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
 |
| `scripts/group-list.lsp` | ;; group-list.lsp - Count every group in the drawing
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
 |

## Quick Start

1. Download the `.lsp` (or `.lin`) file you need
2. In your CAD software, run `APPLOAD`
3. Load the file and type the matching command name shown in the table above

## Compatibility

Tested on GstarCAD 2026/2027 and similar DWG-based platforms. Scripts use
standard AutoLISP functions only, so they work without extra plugins.

For step-by-step [tutorials and drafting guides](https://www.gstarcad.net/cad/),
visit the GstarCAD learning center. New tips are published regularly on the
[GSTARCAD Blog](https://blog.gstarcad.net).

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md).

## License

MIT — see the [LICENSE](LICENSE) file.
