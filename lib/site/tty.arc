(= tty-reset* "\e[00m")

(def pr-reset ()
  (pr tty-reset*))

(mac deftty-color (name code value)
  `(do (= ,(sym:string "tty-" name "*") (+ "\e[" ";" ,value "m"))
       (def ,(sym:string "pr-" name) ()
         (pr ,(sym:string "tty-" name "*")))
       (def ,(sym:string name "-string") args
         (string ,(sym:string "tty-" name "*") args tty-reset*))))

(map [eval `(deftty-color ,@_)] '(
  (black        0 30)
  (blue         0 34)
  (green        0 32)
  (cyan         0 36)
  (red          0 31)
  (purple       0 35)
  (light-gray   0 37)
  (dark-gray    1 30)
  (light-blue   1 34)
  (light-green  1 32)
  (light-cyan   1 36)
  (light-red    1 31)
  (light-purple 1 35)
  (yellow       1 33)
  (white        1 37)
  ))
