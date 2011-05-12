(map load '("strings.arc"
            "pprint.arc"
            "code.arc"
            "html.arc"
            "srv.arc"
            "app.arc"
            "prompt.arc"))

(defmemo require (f) load.f)

(let d "load"
  (map [require:+ d "/" _] dir.d))
