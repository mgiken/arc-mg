(def begins-rest (pattern s)
  (if (begins s pattern)
      (cut s (len pattern))))
