(require "autoload/redef.arc")
(require "autoload/xloop.arc")

(redef readline ((o s (stdin)))
  (aif (readc s)
    (string
     (accum a
       (xloop (c it)
         (if (is c #\return)
              (if (is (peekc s) #\newline)
                   (readc s))
             (is c #\newline)
              nil
              (do (a c)
                  (aif (readc s)
                        (next it)))))))))
