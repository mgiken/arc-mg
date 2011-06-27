(defmemo require (f) load.f)

(let d "load"
  (map [require:+ d "/" _] dir.d))
