(require "load/extend.arc")
(require "load/scheme.arc")

(def parameter ((o init))
  (scheme.make-parameter init))

(extend type (x) (no (no (scheme.parameter? x))) 'parameter)

(def parameterize-implementation (param val thunk)
  (scheme (parameterize ((param val)) (thunk))))

(mac parameterize (param val . body)
  `(parameterize-implementation ,param ,val (fn () ,@body)))
