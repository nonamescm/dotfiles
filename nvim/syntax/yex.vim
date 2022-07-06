syntax keyword Keyword let def fn in do end try rescue where with match
syntax keyword Typedef module trait struct
syntax keyword Include open
syntax keyword Conditional if then else
syntax keyword Boolean true false
syntax match Number /\v<\d+(\.(<\d+)?)?/

syntax match Operator /+/
syntax match Operator /-/
syntax match Operator /*/
syntax match Operator /\//
syntax match Operator /&&&\?/
syntax match Operator /\^\^\^/
syntax match Operator /||\?|\?/
syntax match Operator />>>/
syntax match Operator /<<</
syntax match Operator /|>/
syntax match Operator />>/
syntax match Operator /<=\?/
syntax match Operator />=\?/
syntax match Operator /\(=\|!\)=\?/
syntax match Operator /::/
syntax match Operator /#/
syntax match Operator /\./
syntax keyword Operator is
syntax keyword Operator mod

syntax keyword Operator and or not
syntax match Function /\v((def)\s+)@<=\i+/
syntax match Identifier /\v((((def)\s+\i+('|\?|\!)*)|fn)\s*(\s*\i+\s*)*)@<=\i+/
syntax match Identifier /\v\i+('|\?|\!)*:/
syntax match Identifier /\v\.@<=\i+('|\?|\!)*/
syntax match Type /\v<[A-Z][A-z-0-9-_]*>/
syntax keyword Operator type
syntax region String start=+"+ skip=+\\\\\|\\"+ end=+"+
syntax match Comment /\/\/.*$/
syntax match Constant /:\i\+/
syntax keyword TSConstBuiltin nil this
