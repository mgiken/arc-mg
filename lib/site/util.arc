(def carisa (x type)
    (and acons.x (isa car.x type)))

(mac set-if-nil (x y)
  `(or ,x (= ,x ,y)))

(mac between (var expr within . body)
  (w/uniq first
    `(let ,first t
       (each ,var ,expr
         (unless ,first ,within)
         (wipe ,first)
         ,@body))))

(def partition (test seq)
  (let (passed failed) nil
    (each e seq
      (if test.e
        (push e passed)
        (push e failed)))
    (list rev.passed rev.failed)))

(mac qw args
  `(list ,@(map [string _] args)))
