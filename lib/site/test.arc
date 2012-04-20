(= tests* nil)

(mac test (comp expr expected)
  (w/uniq (gg gr)
    `(do (push [withs (,gg ,expr
                       ,gr (,comp ,gg ,expected))
                  (unless ,gr (pr "not "))
                  (pr "ok " ++._ " - " ',expr " => " ,gg)
                  (unless ,gr (pr ", not the expected result " ,expected))
                  (prn)]
               tests*))))

(def run-test ()
  (prn "1.." len.tests*)
  (on f rev.tests* f.index)
  (wipe tests*))
