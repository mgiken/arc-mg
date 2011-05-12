(require "load/parameter.arc")

(assign dynamic-parameter* (table))

(mac make-dynamic (name param)
  (w/uniq paramval
    `(let ,paramval ,param
       (sref dynamic-parameter* ,paramval ',name)
       (defvar ,name (fn () (,paramval)) (fn (val) (,paramval val))))))

(mac paramfor (name)
  `(dynamic-parameter* ',name))

(mac dlet (name val . body)
  `(parameterize-implementation (paramfor ,name) ,val (fn () ,@body)))

(mac dynamic (name (o init))
  `(make-dynamic ,name (parameter ,init)))
