(mac mail (msg . args)
  `(withs (,@args)
    (pipe-to (system "sendmail -t")
      (prf ,msg))))

(def sendmail (from to subj msg)
  (mail "\
From: #from
To: #to
Subject: #subj

#msg
" from from to to subj subj msg msg))
