(= vtables* (table))
(mac defgeneric(name args . body)
  `(do
    (or= (vtables* ',name) (table))
    (def ,name allargs
      (aif (aand (vtables* ',name) (it (type car.allargs)))
        (apply it allargs)
        (aif (pickles* (type car.allargs))
          (apply ,name (map it allargs))
          (let ,args allargs
            ,@body))))))

(mac defmethod(name args type . body)
  `(= ((vtables* ',name) ',type)
      (fn ,args
        ,@body)))

(= pickles* (table))
(mac pickle(type f)
  `(= (pickles* ',type)
      ,f))
