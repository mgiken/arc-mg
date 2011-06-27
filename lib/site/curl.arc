; TODO: get header
(def build-curl-cmd (url (o data) (o meth 'get) (o ctype))
  (string "curl --compressed -s -L -X '" upcase.meth "' "
          (when ctype
            (string "-H 'Content-type: " ctype "' "))
          (when data
            (string " -d '"
                    (if (isa data 'string)
                        data
                        build-query.data)
                    "' "))
          "'" url "'"))

(def curl (url (o data) (o meth 'get) (o ctype))
  (tostring:system:build-curl-cmd url data meth ctype))
