(require "load/between.arc")

(def 4hex (i)
  (let s (coerce i 'string 16)
    (string (n-of (- 4 (len s)) #\0) s)))

(def json-encoded-char (c)
  (case c
    #\newline "\\n"
    #\"       "\\\""
    #\\       "\\\\"
    (let i (coerce c 'int)
      (if (<  i 32)
           (string "\\u" (4hex i))
           c))))

(def pr-json-string (s)
  (pr #\")
  (each c s (pr:json-encoded-char c))
  (pr #\"))

(def pr-json-object (o)
  (pr #\{)
  (between (k v) o (pr #\,)
    (pr-json-string (string k))
    (pr #\:)
    (tojson v))
  (pr #\}))

(def pr-json-array (a)
  (pr #\[)
  (between v a (pr #\,)
    (tojson v))
  (pr #\]))

(def tojson (v)
  (if (isa v 'string)                (pr-json-string v)
      (or (is v nil) (isa v 'cons))  (pr-json-array v)
      (is v 'true)                   (pr "true")
      (is v 'false)                  (pr "false")
      (is v 'null)                   (pr "null")
      (isa v 'sym)                   (pr-json-string (string v))
      (isa v 'table)                 (pr-json-object v)
      (or (isa v 'int) (isa v 'num)) (pr v)
      (err "can't convert to JSON" v)))
