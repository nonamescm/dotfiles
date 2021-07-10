if exists("b:current_syntax")
	finish
endif

let b:current_syntax = "nolang"

sy match nolangNumber "[0-9-\.]" nextgroup=nolangNumber skipwhite
sy match nolangString '\v"([^"]*)"' nextgroup=nolangString skipwhite
sy match nolangComment "\v\@.*" nextgroup=nolangCommend skipwhite
sy match nolangOperator "\v\%|\.\.|\+|\=|\-|\*|\/" nextgroup=nolangOperator skipwhite
sy match nolangLocal "\v:([A-z-0-9]*){2,}" nextgroup=nolangLocal skipwhite

sy match nolangBoolean "\v<(true|false|none)>" nextgroup=nolangBoolean skipwhite
sy match nolangRepeat "\v<(for|while)>" nextgroup=nolangStatement skipwhite
sy match nolangDefun "\v<defun>" nextgroup=nolangDefun skipwhite
sy match nolangWrite "\v<write(ln)?>" nextgroup=nolangWrite skipwhite
sy match nolangLet "\v<let>" nextgroup=nolangLet skipwhite
sy match nolangCondition "\v<if|elif|else>" nextgroup=nolangCase skipwhite
sy match nolangKeyword "\v<(do|end|in|not|return)>" nextgroup=nolangCase skipwhite
sy match nolangSpecial "\v\.|\(|\{|\}|\)" nextgroup=nolangSpecial skipwhite
sy match nolangToDo "\v<(TODO|FIXME|XXX)>" nextgroup=nolangToDo skipwhite

hi def link nolangRepeat Repeat
hi def link nolangNumber Number
hi def link nolangBoolean Boolean
hi def link nolangKeyword Keyword
hi def link nolangWrite Function
hi def link nolangOperator Operator
hi def link nolangStatement Statement
hi def link nolangDefun Function
hi def link nolangLet Keyword
hi def link nolangCondition Conditional
hi def link nolangComment Comment
hi def link nolangSpecial Special
hi def link nolangToDo Todo
hi def link nolangLocal Identifier
hi def link nolangString String
