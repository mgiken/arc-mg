(def partition (test seq)
  (let (passed failed) nil
    (each e seq
      (if test.e
        (push e passed)
        (push e failed)))
    (list rev.passed rev.failed)))
