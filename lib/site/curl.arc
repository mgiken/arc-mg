(require "sh.arc")
(require "url.arc")

; TODO: get header
(def build-curl-cmd (url (o data) (o meth 'get) (o ctype))
  (string "curl" (escshargs "--compressed" "-s" "-L" "-X" upcase.meth
          (when ctype
            (list "-H" (string "Content-type: " ctype)))
          (when data
            (list "-d"
                  (if (isa data 'string)
                       data
                       build-query.data)))
          url)))

(def curl (url (o data) (o meth 'get) (o ctype))
  (tostring:system:build-curl-cmd url data meth ctype))
