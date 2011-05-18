(def build-query args
  (let p (case (type:car args)
           table (tablist:car args)
           cons  args
           (pair args))
    (when p
      (string:intersperse
        "&"
        (map (fn ((k v))
               (string (urlencode:string k) "=" (urlencode:string v)))
               ;(string k "=" (urlencode:string v)))
             p)))))

(mac url (base . args)
  `(string ,base
           (awhen (build-query ,@args)
             (string "?" it))))
