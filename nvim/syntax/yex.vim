syntax keyword Keyword let def fn become in type end new
syntax keyword Include open
syntax keyword Conditional if else then
syntax keyword Repeat loop
syntax keyword Boolean true false
syntax match Number /\v<\d+(\.(<\d+)?)?/

syntax match Operator /+/
syntax match Operator /-/
syntax match Operator /*/
syntax match Operator /\//
syntax match Operator /%/
syntax match Operator /&&&/
syntax match Operator /\^\^\^/
syntax match Operator /|||/
syntax match Operator />>>/
syntax match Operator /<<</
syntax match Operator /|>/
syntax match Operator />>/
syntax match Operator /<=\?/
syntax match Operator />=\?/
syntax match Operator /\(=\|!\)=\?/
syntax match Operator /::/
syntax match Operator /#/

syntax keyword Operator and or not
syntax match Function /\v([A-z-_][A-z-0-9-_]*('|\?|\!)*)\s*(\()@=/
syntax match Identifier /\v((((let|def|type)\s+[A-z-_][A-z-0-9-_]*('|\?|\!)*)|fn)\s*\((\s*\i+,*\s*)*)@<=\i+/
syntax match Identifier /\v\.@<=\i+/
syntax match Function /\v\.@<=\i+('|\?|\!)*(\s*\()@=/
syntax match Type /\v<[A-Z][A-z-0-9-_]*>/
syntax keyword Operator typeof
syntax region String start=+"+ skip=+\\\\\|\\"+ end=+"+
syntax match Comment /\/\/.*$/
syntax match Constant /\v:\i+/
syntax keyword TSConstBuiltin nil this
