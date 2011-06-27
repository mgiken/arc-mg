(require "load/scheme.arc")

(scheme:xdef readcs
  (lambda (n . str)
    (let ((cs (read-string n (if (pair? str)
                                 (car str)
                                 (current-input-port)))))
      (if (eof-object? cs) 'nil (string->list cs)))))

(scheme:xdef readbs
  (lambda (n . str)
    (let ((bs (read-bytes n (if (pair? str)
                                (car str)
                                (current-input-port)))))
      (if (eof-object? bs) 'nil (bytes->list bs)))))
