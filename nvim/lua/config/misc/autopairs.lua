local Rule = require("nvim-autopairs.rule")
local autopairs = require("nvim-autopairs")

autopairs.add_rule(Rule("$", "$", "tex"))
autopairs.add_rule(Rule("{", "}", "tex"))
