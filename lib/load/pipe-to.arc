(mac pipe-to(dst . body)
  `(fromstring
     (tostring ,@body)
     ,dst))
