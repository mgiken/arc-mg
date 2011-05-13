(mac defrule (name test . body)
  (let arglist (sig name)
    (w/uniq (orig args)
      `(let ,orig ,name
         (= ,name
            (fn ,args
              (aif (apply (fn ,arglist ,test) ,args)
                   (apply (fn ,arglist ,@body) ,args)
                   (apply ,orig ,args))))))))
