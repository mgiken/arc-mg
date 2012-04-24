(mac catcherr body
  `(on-err idfn (fn () ,@body)))

(def makeerr (msg)
  (catcherr (err msg)))

(let i 0

(mac test (comp expr expected)
 `(withs (val (catcherr ,expr)
          res (,comp val ,expected))
    (unless res
      (pr "not "))
    (pr "ok " ,(++ i) " - ")
    (write ',expr)
    (pr " => ")
    (write val);,expr)
    (unless res
      (pr ", not the expected result ")
      (write ,expected))
    (prn)))

(def plan (n)
  (prn "1.." n))

(def done-testing ((o n i))
  (plan n))

)
