(map load '("strings.arc"
            "pprint.arc"
            "code.arc"
            "html.arc"
            "srv.arc"
            "app.arc"
            "prompt.arc"))

(defmemo require (f) load.f)

(let d "autoload"
  (map [require:+ d "/" _] dir.d))
