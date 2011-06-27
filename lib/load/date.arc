(require "load/redef.arc")
(require "load/scheme.arc")

(scheme:require srfi/19)

(= zone-offset* 32400)

(redef date ((o s (seconds)))
  (let zo zone-offset*
    (scheme:time-utc->date (make-time 'time-utc 0 s) zo)))

(redef datestring ((o s (seconds)) (o fmt "~Y-~m-~d"))
  (let d date.s
    (scheme:date->string d fmt)))

(redef seconds ((o datestr) (o fmt "~Y-~m-~d"))
  (if datestr
      (- (int:scheme:date->string (string->date datestr fmt) "~s") zone-offset*)
      (scheme:current-seconds)))
