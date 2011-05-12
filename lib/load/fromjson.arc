(require "load/match.arc")

(def json-true ()
  (mliteral "true" t))

(def json-false ()
  (mliteral "false" nil))

(def json-null ()
  (mliteral "null" nil))

(def json-number-char (x)
  (some x ".-+eE1234567890"))

(def json-number ()
  (coerce (string (many1is json-number-char)) 'num))

(def hexdigit (c)
  (and (isa c 'char)
       (or (<= #\a c #\f) (<= #\A c #\F) (<= #\0 c #\9))))

(def tochar (i)
  (coerce i 'char))

(def hex (s)
  (int s 16))

(def fourhex ()
  (tochar:hex:string
    (must "four hex digits required after \\u"
      (n-of 4 (one hexdigit)))))

(def json-backslash-char (c)
  (case c
    #\" #\"
    #\\ #\\
    #\/ #\/
    #\b #\backspace
    #\f #\page
    #\n #\newline
    #\r #\return
    #\t #\tab
        (err "invalid backslash char" c)))

(def json-backslash-escape ()
  (one #\\)
  (alt (do (one #\u) (fourhex))
       (json-backslash-char (next))))

(def json-string ()
  (one #\")
  (do1 (string (many (alt (json-backslash-escape)
                          (onenot #\"))))
       (must "missing closing quote in JSON string"
             (one #\"))))

(def json-value-here ()
  (alt (json-false)
       (json-true)
       (json-null)
       (json-number)
       (json-string)))

(def json-value ()
  (skipwhite)
  (json-value-here))

(mac wrapped (begin end mustmsg body)
  `(do ,begin
       (do1 ,body
            (skipwhite)
            (must ,mustmsg ,end))))

(def json-array ()
  (wrapped (one #\[) (one #\]) "missing ] in json array"
    (comma-separated (json-value))))

(defalt json-value-here (json-array))

(def json-object-kv ()
  (skipwhite)
  (let key (json-string)
    (skipwhite)
    (must "a JSON object key string must be followed by a :" (one #\:))
    (let value (json-value)
      (list key value))))

(def json-object ()
  (wrapped (one #\{) (one #\}) "missing } in JSON object"
    (listtab (comma-separated (json-object-kv)))))

(defalt json-value-here (json-object))

;; todo this will ignore trailing garbage... do we care about that?

(def fromjson (s)
  (match s (must (string "not a JSON value: " s) (json-value))))
