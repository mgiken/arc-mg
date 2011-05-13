(require "load/dynamic.arc")

(mac make-w/ (name)
  (let w/name (sym (+ "w/" name))
    `(mac ,w/name (val . body)
       `(dlet ,',name ,val ,@body))))

(mac make-implicit (name param)
  `(do (make-dynamic ,name ,param)
       (make-w/ ,name)))

(mac implicit (name (o init))
  `(make-implicit ,name (parameter ,init)))
