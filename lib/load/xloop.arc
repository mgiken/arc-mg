(mac xloop (withses . body)
  (let w (pair withses)
    `((rfn next ,(map car w) ,@body) ,@(map cadr w))))
