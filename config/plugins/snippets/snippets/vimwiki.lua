local ls = require("luasnip")
-- some shorthands...
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local l = require("luasnip.extras").lambda
local rep = require("luasnip.extras").rep
local p = require("luasnip.extras").partial
local m = require("luasnip.extras").match
local n = require("luasnip.extras").nonempty
local dl = require("luasnip.extras").dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local types = require("luasnip.util.types")
local conds = require("luasnip.extras.expand_conditions")

local auto_expand = require("luasnip").expand_auto
require("luasnip").expand_auto = function(...)
	vim.o.undolevels = vim.o.undolevels
	auto_expand(...)
end

return {
	-- I. Auto add "\"
	s({ trig = "inf" }, { t("\\infty "), i(1) }, {}),
	s({ trig = "leq" }, { t("\\leq "), i(1) }, {}),
	s({ trig = "lim" }, { t("\\lim"), i(1) }, {}),
	s({ trig = "par" }, { t("\\partial "), i(1) }, {}),
	s({ trig = "times" }, { t("\\times "), i(1) }, {}),
	s({ trig = "alpha" }, { t("\\alpha"), i(1) }, {}),
	s({ trig = "beta" }, { t("\\beta"), i(1) }, {}),
	s({ trig = "delta" }, { t("\\delta "), i(1) }, {}),
	s({ trig = "epsi" }, { t("\\epsilon"), i(1) }, {}),
	s({ trig = "eta" }, { t("\\eta"), i(1) }, {}),
	s({ trig = "gamma" }, { t("\\gamma"), i(1) }, {}),
	s({ trig = "kappa" }, { t("\\kappa"), i(1) }, {}),
	s({ trig = "lambda" }, { t("\\lambda"), i(1) }, {}),
	s({ trig = "ome" }, { t("\\omega"), i(1) }, {}),
	s({ trig = "phi" }, { t("\\phi"), i(1) }, {}),
	s({ trig = "rho" }, { t("\\rho"), i(1) }, {}),
	s({ trig = "sigma" }, { t("\\sigma"), i(1) }, {}),
	s({ trig = "theta" }, { t("\\theta"), i(1) }, {}),
	s({ trig = "zeta" }, { t("\\zeta"), i(1) }, {}),
	s({ trig = "vare" }, { t("\\varepsilon"), i(1) }, {}),
	s({ trig = "varphi" }, { t("\\varephi"), i(1) }, {}),
	s({ trig = "Delta" }, { t("\\Delta "), i(1) }, {}),
	s({ trig = "Gamma" }, { t("\\Gamma"), i(1) }, {}),
	s({ trig = "Lambda" }, { t("\\Lambda"), i(1) }, {}),
	s({ trig = "Ome" }, { t("\\Omega"), i(1) }, {}),
	s({ trig = "Phi" }, { t("\\Phi"), i(1) }, {}),
	s({ trig = "Sigma" }, { t("\\Sigma"), i(1) }, {}),
	s({ trig = "Theta" }, { t("\\Theta"), i(1) }, {}),
	s({ trig = "lar" }, { t("\\leftarrow"), i(1) }, {}),
	s({ trig = "Lar" }, { t("\\Leftarrow"), i(1) }, {}),
	s({ trig = "rar" }, { t("\\rightarrow"), i(1) }, {}),
	s({ trig = "Rar" }, { t("\\Rightarrow"), i(1) }, {}),
	s({ trig = "lrar" }, { t("\\leftrightarrow"), i(1) }, {}),
	s({ trig = "int" }, { t("\\int"), i(1) }, {}),
	s({ trig = "cong" }, { t("\\cong "), i(1) }, {}),
	s({ trig = "cdot" }, { t("\\cdot "), i(1) }, {}),
	s({ trig = "cdots" }, { t("\\cdots "), i(1) }, {}),
	s({ trig = "vdots" }, { t("\\vdots "), i(1) }, {}),
	s({ trig = "ddots" }, { t("\\ddots "), i(1) }, {}),
	-- II. Auto add "\" and add "()" or "{}""
	s({ trig = "sin" }, fmta("\\sin(<>)<>", { i(1), i(2) }), {}),
	s({ trig = "cos" }, fmta("\\cos(<>)<>", { i(1), i(2) }), {}),
	s({ trig = "tan" }, fmta("\\tan(<>)<>", { i(1), i(2) }), {}),
	s({ trig = "csc" }, fmta("\\csc(<>)<>", { i(1), i(2) }), {}),
	s({ trig = "sec" }, fmta("\\sec(<>)<>", { i(1), i(2) }), {}),
	s({ trig = "cot" }, fmta("\\cot(<>)<>", { i(1), i(2) }), {}),
	s({ trig = "ln" }, fmta("\\ln(<>)<>", { i(1), i(2) }), {}),
	s({ trig = "mbf" }, fmta("\\mathbf{<>}<>", { i(1), i(2) }), {}),
	s({ trig = "mathbf" }, fmta("\\mathbf{<>}<>", { i(1), i(2) }), {}),
	s({ trig = "tag" }, fmta("\\tag{<>}<>", { i(1), i(2) }), {}),
	-- II.j happy reduplicated word
	s({ trig = "ii" }, fmta("$<>$<>", { i(1), i(2) }), {}),
	s({ trig = "fp" }, fmta("f(<>)<>", { i(1), i(2) }), {}),
	s({ trig = "gp" }, fmta("g(<>)<>", { i(1), i(2) }), {}),
	s(
		{ trig = "ttt", snippetType = "autosnippet", wordTrig = false, priority = 2000 },
		fmta("^{<>}<>", { i(1), i(2) }),
		{}
	),
	s(
		{ trig = "bbb", snippetType = "autosnippet", wordTrig = false, priority = 2000 },
		fmta("_{<>}<>", { i(1), i(2) }),
		{}
	),
	s(
		{ trig = "ppp", snippetType = "autosnippet", wordTrig = false, priority = 2000 },
		fmta("(<>)<>", { i(1), i(2) }),
		{}
	),
	-- III. Others
	s({ trig = "\\lims" }, { t("\\lim\\limits_{"), i(1, "x"), t(" \\to "), i(2, "\\infty"), t("}"), i(3), t(".") }, {}),
	s(
		{ trig = "leri", snippetType = "autosnippet", priority = 2000 },
		c(1, {
			fmta("\\left(<>\\right)<>", { i(1), i(2) }),
			fmta("\\left\\{<>\\right\\}<>", { i(1), i(2) }),
			fmta("\\left(<>\\right.<>", { i(1), i(2) }),
			fmta("\\left\\{<>\\right.<>", { i(1), i(2) }),
		}),
		{}
	),
	s({ trig = "frac" }, fmta("\\frac{<>}{<>}<>", { i(1), i(2), i(3) }), {}),
	s(
		{ trig = "bga", snippetType = "autosnippet", priority = 2000 },
		fmta(
			[[
          \begin{array}{<>}
            <><>
          \end{array}
      ]],
			{ c(2, { i(1), t("l"), t("r") }), i(1), i(3) }
		),
		{}
	),
	s(
		{ trig = "ovt", snippetType = "autosnippet", priority = 2000 },
		c(1, {
			fmta("\\overset{<>}{<>}<>", { i(1), i(2), i(3) }),
			fmta("\\overset{\\text{l'H}}{=}<>", { i(1) }),
			fmta("\\overset{<>}{\\sum\\limits_{<>=1}}<><>", { i(3, "n"), i(2, "i"), i(1), i(4) }),
		}),
		{}
	),
	s(
		{ trig = "aln", snippetType = "autosnippet", priority = 2000 },
		c(1, {
			fmta(
				[[
          {{$%align%
            <>
          }}$
        ]],
				{ i(1) }
			),
			fmta(
				[[
          {{$
          \boxed{
          \begin{array}{<>}
            <><>
          \end{array}
          }
          }}$
        ]],
				{ c(2, { t("l"), t("r"), i(1) }), i(1), i(3) }
			),
			fmta(
				[[
          {{$
          \boxed{
            <>
          }
          }}$
        ]],
				{ i(1) }
			),
		}),
		{}
	),
}
