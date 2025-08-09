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
	s({ trig = "inf", snippetType = "autosnippet", priority = 2000 }, { t("\\infty "), i(1) }, {}),
	s({ trig = "int", snippetType = "autosnippet", priority = 2000 }, { t("\\int"), i(1) }, {}),
	s({ trig = "leq", snippetType = "autosnippet", priority = 2000 }, { t("\\leq "), i(1) }, {}),
	s({ trig = "lim", snippetType = "autosnippet", priority = 2000 }, { t("\\lim"), i(1) }, {}),
	s({ trig = "par", snippetType = "autosnippet", priority = 2000 }, { t("\\partial "), i(1) }, {}),
	s({ trig = "times", snippetType = "autosnippet", priority = 2000 }, { t("\\times "), i(1) }, {}),
	s({ trig = "alpha", snippetType = "autosnippet", priority = 2000 }, { t("\\alpha"), i(1) }, {}),
	s({ trig = "beta", snippetType = "autosnippet", priority = 2000 }, { t("\\beta"), i(1) }, {}),
	s({ trig = "delta", snippetType = "autosnippet", priority = 2000 }, { t("\\delta "), i(1) }, {}),
	s({ trig = "epsi", snippetType = "autosnippet", priority = 2000 }, { t("\\epsilon"), i(1) }, {}),
	s({ trig = "eta", snippetType = "autosnippet", priority = 2000 }, { t("\\eta"), i(1) }, {}),
	s({ trig = "gamma", snippetType = "autosnippet", priority = 2000 }, { t("\\gamma"), i(1) }, {}),
	s({ trig = "kappa", snippetType = "autosnippet", priority = 2000 }, { t("\\kappa"), i(1) }, {}),
	s({ trig = "lambda", snippetType = "autosnippet", priority = 2000 }, { t("\\lambda"), i(1) }, {}),
	s({ trig = "ome", snippetType = "autosnippet", priority = 2000 }, { t("\\omega"), i(1) }, {}),
	s({ trig = "phi", snippetType = "autosnippet", priority = 2000 }, { t("\\phi"), i(1) }, {}),
	s({ trig = "rho", snippetType = "autosnippet", priority = 2000 }, { t("\\rho"), i(1) }, {}),
	s({ trig = "sigma", snippetType = "autosnippet", priority = 2000 }, { t("\\sigma"), i(1) }, {}),
	s({ trig = "theta", snippetType = "autosnippet", priority = 2000 }, { t("\\theta"), i(1) }, {}),
	s({ trig = "zeta", snippetType = "autosnippet", priority = 2000 }, { t("\\zeta"), i(1) }, {}),
	s({ trig = "vare", snippetType = "autosnippet", priority = 2000 }, { t("\\varepsilon"), i(1) }, {}),
	s({ trig = "varphi", snippetType = "autosnippet", priority = 2000 }, { t("\\varephi"), i(1) }, {}),
	s({ trig = "Delta", snippetType = "autosnippet", priority = 2000 }, { t("\\Delta "), i(1) }, {}),
	s({ trig = "Gamma", snippetType = "autosnippet", priority = 2000 }, { t("\\Gamma"), i(1) }, {}),
	s({ trig = "Lambda", snippetType = "autosnippet", priority = 2000 }, { t("\\Lambda"), i(1) }, {}),
	s({ trig = "Ome", snippetType = "autosnippet", priority = 2000 }, { t("\\Omega"), i(1) }, {}),
	s({ trig = "Phi", snippetType = "autosnippet", priority = 2000 }, { t("\\Phi"), i(1) }, {}),
	s({ trig = "Sigma", snippetType = "autosnippet", priority = 2000 }, { t("\\Sigma"), i(1) }, {}),
	s({ trig = "Theta", snippetType = "autosnippet", priority = 2000 }, { t("\\Theta"), i(1) }, {}),
	s({ trig = "cdot", snippetType = "autosnippet", priority = 2000 }, { t("\\cdot "), i(1) }, {}),
	-- II. Auto add "\" and add "()" or "{}""
	s({ trig = "sin", snippetType = "autosnippet", priority = 2000 }, fmta("\\sin(<>)<>", { i(1), i(2) }), {}),
	s({ trig = "cos", snippetType = "autosnippet", priority = 2000 }, fmta("\\cos(<>)<>", { i(1), i(2) }), {}),
	s({ trig = "tan", snippetType = "autosnippet", priority = 2000 }, fmta("\\tan(<>)<>", { i(1), i(2) }), {}),
	s({ trig = "csc", snippetType = "autosnippet", priority = 2000 }, fmta("\\csc(<>)<>", { i(1), i(2) }), {}),
	s({ trig = "sec", snippetType = "autosnippet", priority = 2000 }, fmta("\\sec(<>)<>", { i(1), i(2) }), {}),
	s({ trig = "cot", snippetType = "autosnippet", priority = 2000 }, fmta("\\cot(<>)<>", { i(1), i(2) }), {}),
	s({ trig = "ln", snippetType = "autosnippet", priority = 2000 }, fmta("\\ln(<>)<>", { i(1), i(2) }), {}),
	s({ trig = "mbf", snippetType = "autosnippet", priority = 2000 }, fmta("\\mathbf{<>}<>", { i(1), i(2) }), {}),
	-- II.j happy reduplicated word
	s({ trig = "ii", snippetType = "autosnippet", priority = 2000 }, fmta("$<>$<>", { i(1), i(2) }), {}),
	s({ trig = "fp", snippetType = "autosnippet", priority = 2000 }, fmta("f(<>)<>", { i(1), i(2) }), {}),
	s({ trig = "gp", snippetType = "autosnippet", priority = 2000 }, fmta("g(<>)<>", { i(1), i(2) }), {}),
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
	s(
		{ trig = "\\lims", snippetType = "autosnippet", priority = 2000 },
		{ t("\\lim\\limits_{"), i(1, "x"), t(" \\to "), i(2, "\\infty"), t("}"), i(3), t(".") },
		{}
	),
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
	s(
		{ trig = "frac", snippetType = "autosnippet", priority = 2000 },
		fmta("\\frac{<>}{<>}<>", { i(1), i(2), i(3) }),
		{}
	),
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
