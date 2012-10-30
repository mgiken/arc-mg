; taken from http://awwx.ws/table-rw3.arc with slight modifications
; - Mark Huetsch

(def parse-table-items (port (o acc '(obj)))
  (scheme.skip-whitespace port)
  (if (is (peekc port) #\})
      (do (readc port) (ar-nil-terminate:rev acc))
      (with (k (read port)
             v (read port))
        (parse-table-items port (join (list v k) acc)))))

(extend-readtable #\{ parse-table-items)

(extend ac-literal (x) (errsafe:isa x 'table)
  scheme-t)
