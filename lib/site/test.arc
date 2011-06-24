(= tests* nil)

;ugly
(def istab (x y)
  (let cmp (fn (l r) (> car.l car.r))
    (iso (sort cmp tablist.x) (sort cmp tablist.y))))

(mac test (expr expected (o comp 'is))
  (w/uniq (gg gr)
    `(do (push [withs (,gg ,expr
                       ,gr (,comp ,gg ,expected))
                 (unless ,gr (pr "not "))
                 (pr "ok " ++._ " - " ',expr " => " ,gg)
                 (unless ,gr (pr ", not the expected result " ,expected))
                 (prn)]
             tests*)
       nil)))

(def run-test ()
  (prn "1.." len.tests*)
  (on f rev.tests* f.index)
  wipe.tests*)
