(mac redef (name parms . body)
  `(do (sref sig ',parms ',name)
       (assign ,name (fn ,parms ,@body))))
