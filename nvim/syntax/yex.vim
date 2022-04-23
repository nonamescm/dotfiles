syntax keyword Keyword let def fn in do end new try rescue
syntax keyword Typedef class
syntax keyword Include open
syntax keyword Conditional when if then elseif else
syntax keyword Boolean true false
syntax match Number /\v<\d+(\.(<\d+)?)?/

syntax match Operator /+/
syntax match Operator /-/
syntax match Operator /*/
syntax match Operator /\//
syntax match Operator /%/
syntax match Operator /&&&\?/
syntax match Operator /\^\^\^/
syntax match Operator /|||\?/
syntax match Operator />>>/
syntax match Operator /<<</
syntax match Operator /|>/
syntax match Operator />>/
syntax match Operator /<=\?/
syntax match Operator />=\?/
syntax match Operator /\(=\|!\)=\?/
syntax match Operator /::/
syntax match Operator /@/
syntax match Operator /is/

syntax keyword Operator and or not
syntax match Function /\v([A-z-_][A-z-0-9-_]*('|\?|\!)*)\s*(\()@=/
syntax match Identifier /\v((((let|def|class)\s+[A-z-_][A-z-0-9-_]*('|\?|\!)*)|fn)\s*\((\s*\i+,*\s*)*)@<=\i+/
syntax match Identifier /\v\.@<=\i+/
syntax match Function /\v\.@<=\i+('|\?|\!)*(\s*\()@=/
syntax match Type /\v<[A-Z][A-z-0-9-_]*>/
syntax keyword Operator typeof
syntax region String start=+"+ skip=+\\\\\|\\"+ end=+"+
syntax match Comment /\/\/.*$/
syntax match Constant /@\i\+/
syntax keyword TSConstBuiltin nil this
