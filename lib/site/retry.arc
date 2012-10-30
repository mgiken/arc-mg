(mac retry (n . body)
  (w/uniq gn
    `((afn (,gn)
      (if (is ,gn 0)
          (err "Failed to retry")
          (or (do ,@body) (self (- ,gn 1)))))
      ,n)))
