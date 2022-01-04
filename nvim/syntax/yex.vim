syntax keyword Keyword let def fn become in
syntax keyword Include open
syntax keyword Conditional if else then
syntax keyword Boolean true false
syntax match Number /\<\d\+/
syntax match Function /[A-z-_][A-z-0-9-_]*\ze\s*(/
syntax match Operator /\v(\+|\-|\/|\*|\&\&\&|\^\^\^|::|\=\=?|\>\>|(\|\>)|#|(\<|\>)\=?)/
syntax match Function /\v((let|def)\s+)@<=([A-z-_][A-z-0-9-_]*)(\s+[A-z-_][A-z-0-9-_]*)@=/
syntax match Identifier /\v((let|def)\s+[A-z-_][A-z-0-9-_]*)@<=(\s+\i+)+/
syntax region String start=+"+ skip=+\\\\\|\\"+ end=+"+
syntax match Comment /\/\/.*$/
syntax match Constant /\v:\i+/
syntax keyword TSConstBuiltin nil
