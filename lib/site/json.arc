(scheme:require:file "site/json.ss")

(scheme:xdef readjson read-json)

(scheme:xdef writejson write-json)

(scheme:xdef fromjson json->jsexpr)

(scheme:xdef tojson jsexpr->json)
