if exists("b:current_syntax")
	finish
endif

let b:current_syntax = "nolang"

sy match nolangNumber "[0-9-\.]"
sy match nolangParen "(" contains=cParen
sy match nolangCall "\w\+\s*(" contains=nolangParen
sy match nolangString '\v"([^"]*)"'
sy match nolangString '\v\'([^\']*)\''
sy match nolangComment "\v\@.*"
sy match nolangOperator "\v\%|\.\.|\+|\=|\-|\*|\/|\<|\>"
sy match nolangBoolean "\v<(true|false|none)>"
sy match nolangWrite "\v<write(ln)?>"
sy match nolangLet "\v<(let|defn)>"
sy match nolangCondition "\v<if|elif|else|then>"
sy match nolangKeyword "\v<(do|done|end|not|return)>"
sy match nolangSpecial "\v\.|\(|\{|\}|\)"
sy match nolangToDo "\v<(TODO|FIXME|XXX)>"

hi def link nolangRepeat Repeat
hi def link nolangCall Function
hi def link nolangNumber Number
hi def link nolangBoolean Boolean
hi def link nolangKeyword Keyword
hi def link nolangWrite Function
hi def link nolangOperator Operator
hi def link nolangLet Keyword
hi def link nolangCondition Conditional
hi def link nolangComment Comment
hi def link nolangSpecial Special
hi def link nolangToDo Todo
hi def link nolangLocal Identifier
hi def link nolangString String
