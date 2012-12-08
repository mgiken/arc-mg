(scheme:require:file "site/json.rkt")

(scheme:begin
  (xdef readjson  read-json)
  (xdef writejson write-json)
  (xdef fromjson  string->jsexpr)
  (xdef tojson    jsexpr->string))
