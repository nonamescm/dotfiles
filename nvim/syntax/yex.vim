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
syntax keyword Operator is
syntax keyword Operator and or not

syntax match Function /\v(def(\s|\n)+)@<=\i+('|\?|\!)*/
syntax match Function /\v\.@<=\i+('|\?|\!)*/
syntax match Identifier /\v(def(\s|\n)+\i+('|\?|\!)*(\s|\n)+)@<=(\i+('|\?|\!)*(\s|\n)*)+/
syntax match Identifier /\v(fn(\s|\n)+)@<=(\i+('|\?|\!)*(\s|\n)*)+/
syntax match Type /\v<[A-Z]\i*('|\?|\!)*>/
syntax region String start=+"+ skip=+\\\\\|\\"+ end=+"+
syntax match Comment /\/\/.*$/
syntax match Constant /:\i\+/

syntax keyword TSConstBuiltin nil
syntax keyword Keyword let def member fn in try rescue where match with end
syntax keyword Typedef type with
syntax keyword Include open
syntax keyword Conditional if then else
syntax keyword Boolean true false
syntax match Number /\v<\d+(\.(<\d+)?)?/

