#! /bin/sh
#| -*- scheme -*-
exec csi -include-path /usr/local/share/scheme -s $0 "$@"
|#
(use r7rs)
(include "snow/assert.sld")
(include "snow/input-parse.sld")
(include "seth/cout.sld")
(include "seth/math-3d.sld")
(include "seth/obj-model.sld")


(import (scheme base)
        (scheme process-context)
        (seth obj-model))


(define (main-program)
  (let ((model (make-model '() '() '())))
    (let loop ((input-files (cdr (command-line))))
      (cond ((null? input-files)
             (compact-obj-model model)
             (fix-implied-normals model)
             (write-obj-model model (current-output-port)))
            (else
             (read-obj-model-file (car input-files) model)
             (loop (cdr input-files)))))))

(main-program)
