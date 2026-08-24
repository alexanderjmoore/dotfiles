-- ~/.config/nvim/lua/plugins/tokyonight.lua

return {
  {
    "folke/tokyonight.nvim",
    opts = {
      style = "night",

      on_highlights = function(hl, c)
        -- Catppuccin Mocha semantic roles translated to the closest
        -- equivalents available in the Tokyo Night palette.
        local ctp = {
          text = c.fg,
          comment = c.dark5,

          red = c.red,
          peach = c.orange,
          yellow = c.yellow,
          green = c.green,
          teal = c.green1,
          sky = c.blue5,
          sapphire = c.cyan,
          blue = c.blue,
          lavender = c.fg_dark,
          mauve = c.magenta,
          purple = c.purple,
          pink = c.magenta,
        }

        ------------------------------------------------------------------------
        -- Traditional Vim syntax groups
        ------------------------------------------------------------------------

        hl.Comment = { fg = ctp.comment }

        hl.Constant = { fg = ctp.peach }
        hl.String = { fg = ctp.green }
        hl.Character = { fg = ctp.teal }
        hl.Number = { fg = ctp.peach }
        hl.Float = { link = "Number" }
        hl.Boolean = { fg = ctp.peach }

        hl.Identifier = { fg = ctp.red }
        hl.Function = { fg = ctp.blue }

        hl.Statement = { fg = ctp.mauve }
        hl.Conditional = { fg = ctp.mauve }
        hl.Repeat = { fg = ctp.mauve }
        hl.Keyword = { fg = ctp.mauve }
        hl.Exception = { fg = ctp.mauve }

        hl.Operator = { fg = ctp.sky }

        hl.PreProc = { fg = ctp.pink }
        hl.Include = { fg = ctp.mauve }
        hl.Define = { fg = ctp.pink }
        hl.Macro = { fg = ctp.mauve }

        hl.StorageClass = { fg = ctp.yellow }
        hl.Structure = { fg = ctp.yellow }
        hl.Type = { fg = ctp.yellow }
        hl.Typedef = { link = "Type" }

        hl.Special = { fg = ctp.pink }
        hl.SpecialChar = { link = "Special" }

        hl.Label = { fg = ctp.sapphire }
        hl.Delimiter = { fg = ctp.comment }

        ------------------------------------------------------------------------
        -- Treesitter: identifiers
        ------------------------------------------------------------------------

        hl["@variable"] = { fg = ctp.text }
        hl["@variable.builtin"] = { fg = ctp.red }
        hl["@variable.parameter"] = { fg = ctp.red }

        -- Struct fields / object members
        hl["@variable.member"] = { fg = ctp.sky }

        hl["@constant"] = { fg = ctp.peach }
        hl["@constant.builtin"] = { fg = ctp.peach }
        hl["@constant.macro"] = { fg = ctp.mauve }

        -- Packages / namespaces / modules
        hl["@module"] = { fg = ctp.yellow }

        ------------------------------------------------------------------------
        -- Treesitter: literals
        ------------------------------------------------------------------------

        hl["@string"] = { fg = ctp.green }
        hl["@string.documentation"] = { fg = ctp.teal }
        hl["@string.regexp"] = { fg = ctp.pink }
        hl["@string.escape"] = { fg = ctp.pink }
        hl["@string.special"] = { fg = ctp.pink }
        hl["@string.special.path"] = { fg = ctp.pink }
        hl["@string.special.symbol"] = { fg = ctp.red }

        hl["@character"] = { fg = ctp.teal }
        hl["@character.special"] = { fg = ctp.pink }

        hl["@boolean"] = { fg = ctp.peach }
        hl["@number"] = { fg = ctp.peach }
        hl["@number.float"] = { fg = ctp.peach }

        ------------------------------------------------------------------------
        -- Treesitter: types
        ------------------------------------------------------------------------

        -- All types use the same yellow, whether user-defined or built-in.
        hl["@type"] = { fg = ctp.yellow }
        hl["@type.definition"] = { fg = ctp.yellow }
        hl["@type.builtin"] = { fg = ctp.yellow }

        hl["@attribute"] = { fg = ctp.peach }

        -- Struct fields / properties use the light blue operator color.
        hl["@property"] = { fg = ctp.sky }

        ------------------------------------------------------------------------
        -- Treesitter: functions
        ------------------------------------------------------------------------

        hl["@function"] = { fg = ctp.blue }
        hl["@function.call"] = { fg = ctp.blue }
        hl["@function.method"] = { fg = ctp.blue }
        hl["@function.method.call"] = { fg = ctp.blue }

        -- Builtin functions
        hl["@function.builtin"] = { fg = ctp.peach }

        hl["@function.macro"] = { fg = ctp.pink }
        hl["@constructor"] = { fg = ctp.yellow }

        ------------------------------------------------------------------------
        -- Treesitter: keywords / operators
        ------------------------------------------------------------------------

        hl["@keyword"] = { fg = ctp.mauve }
        hl["@keyword.modifier"] = { fg = ctp.mauve }
        hl["@keyword.type"] = { fg = ctp.mauve }
        hl["@keyword.coroutine"] = { fg = ctp.mauve }
        hl["@keyword.function"] = { fg = ctp.mauve }
        hl["@keyword.operator"] = { fg = ctp.mauve }
        hl["@keyword.import"] = { fg = ctp.mauve }
        hl["@keyword.repeat"] = { fg = ctp.mauve }
        hl["@keyword.return"] = { fg = ctp.mauve }
        hl["@keyword.exception"] = { fg = ctp.mauve }
        hl["@keyword.conditional"] = { fg = ctp.mauve }
        hl["@keyword.directive"] = { fg = ctp.pink }

        hl["@operator"] = { fg = ctp.sky }

        ------------------------------------------------------------------------
        -- Treesitter: punctuation / comments
        ------------------------------------------------------------------------

        hl["@punctuation.delimiter"] = { fg = ctp.comment }
        hl["@punctuation.bracket"] = { fg = ctp.comment }
        hl["@punctuation.special"] = { fg = ctp.pink }

        hl["@comment"] = { fg = ctp.comment }
        hl["@comment.documentation"] = { fg = ctp.comment }

        ------------------------------------------------------------------------
        -- Treesitter: tags
        ------------------------------------------------------------------------

        hl["@tag"] = { fg = ctp.blue }
        hl["@tag.builtin"] = { fg = ctp.blue }
        hl["@tag.attribute"] = { fg = ctp.yellow }
        hl["@tag.delimiter"] = { fg = ctp.teal }

        ------------------------------------------------------------------------
        -- LSP semantic tokens
        ------------------------------------------------------------------------

        hl["@lsp.type.interface"] = { link = "@type" }

        -- Fields / properties
        hl["@lsp.type.property"] = { fg = ctp.sky }

        -- Built-in/default-library types should still look like every other type.
        hl["@lsp.typemod.class.defaultLibrary"] = { link = "@type.builtin" }
        hl["@lsp.typemod.enum.defaultLibrary"] = { link = "@type.builtin" }
        hl["@lsp.typemod.struct.defaultLibrary"] = { link = "@type.builtin" }
        hl["@lsp.typemod.type.defaultLibrary"] = { link = "@type.builtin" }
        hl["@lsp.typemod.typeAlias.defaultLibrary"] = { link = "@type.builtin" }

        hl["@lsp.typemod.function.defaultLibrary"] = { link = "@function.builtin" }
        hl["@lsp.typemod.method.defaultLibrary"] = { link = "@function.builtin" }

        hl["@lsp.typemod.variable.defaultLibrary"] = { link = "@variable.builtin" }
      end,
    },
  },
}
