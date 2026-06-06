local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep

return {
	s(
		{ trig = "\\begin", snippetType="autosnippet" },
		fmta(
			[[
				\begin{<>}
					<>
				\end{<>}
			]],
			{ i(1), i(2), rep(1), }
		)
	),
	s(
		{ trig = "\\frac", snippetType = "autosnippet" },
		fmta("\\frac{<>}{<>}", { i(1), i(2) })
	),
	s(
		{ trig = "->", snippetType = "autosnippet" },
		fmta("\\to ", {})
	),
	s(
		{ trig = "=>", snippetType = "autosnippet" },
		fmta("\\Rightarrow ", {})
	),
	s(
		{ trig = " <=> ", snippetType = "autosnippet" },
		fmta("\\Leftrightarrow ", {})
	)
}
