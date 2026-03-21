if exists("b:current_syntax")
	finish
endif
"\""
let b:current_syntax = "livep"
sy match liveNumber "\v[0-9]+(\.[0-9]+)?"
sy match liveCall "\w\+\ze("
sy match liveDelimiter "[]){,}([]"
sy match liveString '\v"(\\"|[^"])*([^\\]\\)@<!"'
sy match liveString "\v'(\\'|[^'])*([^\\]\\)@<!'"
sy match liveKeyword "\v<(def|se|senao|enquanto|para|local|retorne|ate)>"
sy match liveBoolean "\v<(verdade|falso|nulo)>"
sy match liveOperator "\v\+"
sy match liveOperator "-"
sy match liveOperator "*"
sy match liveOperator "/"
sy match liveOperator ">"
sy match liveOperator "<"
sy match liveOperator "="

hi def link liveNumber Number
hi def link liveCall Function
hi def link liveFunctionDeclaration Function
hi def link liveKeyword Keyword
hi def link liveBoolean Boolean
hi def link liveOperator Operator
hi def link liveDelimiter Delimiter
hi def link liveString String
