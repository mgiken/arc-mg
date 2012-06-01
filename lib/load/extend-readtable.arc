; http://awwx.ws/extend-readtable0.arc

(require "load/scheme.arc")

(def extend-readtable (c parser (o mode 'non-terminating-macro))
  (scheme
   (current-readtable
    (make-readtable (current-readtable)
                    c
                    mode
                    (lambda (ch port src line col pos)
                      (parser port))))))
