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

; regex from http://search.cpan.org/~gaas/URI/URI.pm#PARSING_URIs_WITH_REGEXP

(def parse-url (url)
  (withs ((scheme hostport path query frag)
          (re-match
           "(?:([^:/?#]+):)?(?://([^/?#]*))?([^?#]*)(?:\\?([^#]*))?(?:#(.*))?"
           url)
          (host port) (tokens hostport #\:))
    (obj scheme (sym scheme)
         hostport hostport
         host host
         port (errsafe:int port)
         path path
         query query
         frag frag)))
