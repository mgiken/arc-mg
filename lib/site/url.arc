(def build-query args
  (awhen (case (type:car args)
           table (tablist:car args)
           cons  args
                 pair.args)
    (string:intersperse "&"
      (trues (fn ((k v))
               (when v
                 (string (urlencode:string k) "=" (urlencode:string v))))
             it))))

(mac url (base . args)
  (let base (if acons.base
                (cons 'list (intersperse "/" base))
                base)
    `(string ,base
             (awhen (build-query ,@args)
               (list "?" it)))))

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
