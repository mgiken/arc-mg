(mac ret (var val . body)
  (w/uniq gval
    `(withs (,gval ,val ,var ,gval)
       ,@body
       ,gval)))
