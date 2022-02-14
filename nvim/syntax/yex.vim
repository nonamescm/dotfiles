syntax keyword Keyword let def fn become in
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
syntax match Function /\v((let|def)\s+)@<=([A-z-_][A-z-0-9-_]*)(\s+[A-z-_][A-z-0-9-_]*)@=/
syntax match Identifier /\v((let|def)\s+[A-z-_][A-z-0-9-_]*)@<=(\s+\i+)+/
syntax region String start=+"+ skip=+\\\\\|\\"+ end=+"+
syntax match Comment /\/\/.*$/
syntax match Constant /\v:\i+/
syntax keyword TSConstBuiltin nil
