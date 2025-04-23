return {
  {
    "windwp/nvim-autopairs",
    enabled = false,
    event = "InsertEnter",
    -- opts = function ()
    --   local map_cr = true
    --   local map_bs = true  -- map the <BS> key
    --   local map_c_h = true  -- Map the <C-h> key to delete a pair
    --   local map_c_w = true -- map <c-w> to delete a pair if possible
    --
    -- end,
    config = function()
      -- put this to setup function and press <a-e> to use fast_wrap
      local npairs = require "nvim-autopairs"
      local Rule = require "nvim-autopairs.rule"
      local cond = require "nvim-autopairs.conds"

      npairs.setup {

        disable_filetype = { "TelescopePrompt", "spectre_panel" },
        disable_in_macro = true, -- disable when recording or executing a macro,
        disable_in_visualblock = false, -- disable when insert after visual block mode,
        disable_in_replace_mode = true,
        ignored_next_char = [=[[%w%%%'%[%"%.%`%$]]=],
        enable_moveright = true,
        enable_afterquote = true, -- add bracket pairs after quote,
        enable_check_bracket_line = true, --- check bracket in same line,
        enable_bracket_in_quote = true, --,
        enable_abbr = false, -- trigger abbreviation,
        break_undo = true, -- switch for basic rule break undo sequence,
        map_cr = true,
        map_bs = true, -- map the <BS> key,
        map_c_h = true, -- Map the <C-h> key to delete a pair,
        map_c_w = true, -- map <c-w> to delete a pair if possible,

        fast_wrap = {
          manual_position = true,
          cursor_pos_before = true,
          map = "<M-e>",
          chars = { "`", "{", "[", "(", '"', "'" },
          pattern = [=[[%'%"%>%]%)%}%,]]=],
          end_key = "'",
          check_ts = false,
          before_key = "h",
          after_key = "l",
          keys = "qwertyuiopzxcvbnmasdfghjkl",
          highlight = "Search",
          highlight_grey = "Comment",
        },
      }
      -- npairs.setup {
      --   -- check_ts = true,
      --   -- ts_config = {
      --   --     lua = {'string'},-- it will not add a pair on that treesitter node
      --   --     javascript = {'template_string'},
      --   --     java = false,-- don't check treesitter on java
      --   --  }
      --   -- change default fast_wrap
      --   enable_moveright = true,
      --   map_c_w = true,
      --   check_ts = false,
      --   -- enable_check_bracket_line = false,
      --   map_c_h = true,
      --   fast_wrap = {
      --     map = "<M-e>",
      --     chars = { "{", "[", "(", '"', "'" },
      --     pattern = [=[[%'%"%>%]%)%}%,]]=],
      --     end_key = "'",
      --     check_ts = true,
      --     before_key = "h",
      --     after_key = "l",
      --     cursor_pos_before = true,
      --     keys = "qwertyuiopzxcvbnmasdfghjkl",
      --     manual_position = false,
      --     highlight = "Search",
      --     highlight_grey = "Comment",
      --   },
      -- }

      local ts_conds = require "nvim-autopairs.ts-conds"

      -- press % => %% only while inside a comment or string
      npairs.add_rules {
        Rule("%", "%", "lua"):with_pair(ts_conds.is_ts_node { "string", "comment" }),
        Rule("$", "$", "lua"):with_pair(ts_conds.is_not_ts_node { "function" }),

        -- Rule('%(.*%)%s*%=>$', ' {  }', { 'typescript', 'typescriptreact', 'javascript' })
        --       :use_regex(true),
        -- :set_end_pair_length(2),
      }

      local brackets = { { "(", ")" }, { "[", "]" }, { "{", "}" } }
      npairs.add_rules {
        -- Rule for a pair with left-side ' ' and right side ' '
        Rule(" ", " ")
          -- Pair will only occur if the conditional function returns true
          :with_pair(function(opts)
            -- We are checking if we are inserting a space in (), [], or {}
            local pair = opts.line:sub(opts.col - 1, opts.col)
            return vim.tbl_contains({
              brackets[1][1] .. brackets[1][2],
              brackets[2][1] .. brackets[2][2],
              brackets[3][1] .. brackets[3][2],
            }, pair)
          end)
          :with_move(cond.none())
          :with_cr(cond.none())
          -- We only want to delete the pair of spaces when the cursor is as such: ( | )
          :with_del(
            function(opts)
              local col = vim.api.nvim_win_get_cursor(0)[2]
              local context = opts.line:sub(col - 1, col + 2)
              return vim.tbl_contains({
                brackets[1][1] .. "  " .. brackets[1][2],
                brackets[2][1] .. "  " .. brackets[2][2],
                brackets[3][1] .. "  " .. brackets[3][2],
              }, context)
            end
          ),
      }
      -- For each pair of brackets we will add another rule
      for _, bracket in pairs(brackets) do
        npairs.add_rules {
          -- Each of these rules is for a pair with left-side '( ' and right-side ' )' for each bracket type
          Rule(bracket[1] .. " ", " " .. bracket[2])
            :with_pair(cond.none())
            :with_move(function(opts) return opts.char == bracket[2] end)
            :with_del(cond.none())
            :use_key(bracket[2])
            -- Removes the trailing whitespace that can occur without this
            :replace_map_cr(
              function(_) return "<C-c>2xi<CR><C-c>O" end
            ),
        }
      end
    end,
  },

  {
    "jiangmiao/auto-pairs",
    enabled = true,
    event = "VeryLazy",
    config = function() end,
  },
  {
    "altermo/ultimate-autopair.nvim",
    enabled = false,
    event = { "InsertEnter", "CmdlineEnter" },
    -- branch = "v0.6", --recommended as each new version will have breaking changes
    -- config = function() require("altermo/ultimate-autopair.nvim").pair "{{'<','>'}}" end,
    opts = {
      profile = "default",
      --what profile to use
      map = true,
      --whether to allow any insert map
      cmap = true, --cmap stands for cmd-line map
      --whether to allow any cmd-line map
      pair_map = true,
      --whether to allow pair insert map
      pair_cmap = true,
      --whether to allow pair cmd-line map
      multiline = true,
      --enable/disable multiline
      bs = { -- *ultimate-autopair-map-backspace-config*
        enable = true,
        map = "<bs>", --string or table
        cmap = "<bs>", --string or table
        overjumps = true,
        --(|foo) > bs > |foo
        space = true, --false, true or 'balance'
        --( |foo ) > bs > (|foo)
        --balance:
        --  Will prioritize balanced spaces
        --  ( |foo  ) > bs > ( |foo )
        indent_ignore = false,
        --(\n\t|\n) > bs > (|)
        single_delete = false,
        -- <!--|--> > bs > <!-|
        conf = {},
        --contains extension config
        multi = false,
        --use multiple configs (|ultimate-autopair-map-multi-config|)
      },
      cr = { -- *ultimate-autopair-map-newline-config*
        enable = true,
        map = "<cr>", --string or table
        autoclose = false,
        --(| > cr > (\n|\n)
        conf = { cond = function(fn) return not fn.in_lisp() end },
        --contains extension config
        multi = false,
        --use multiple configs (|ultimate-autopair-map-multi-config|)
      },
      space = { -- *ultimate-autopair-map-space-config*
        enable = true,
        map = " ", --string or table
        cmap = " ", --string or table
        check_box_ft = { "markdown", "vimwiki", "org" },
        _check_box_ft2 = { "norg" }, --may be removed
        --+ [|] > space > + [ ]
        conf = {},
        --contains extension config
        multi = false,
        --use multiple configs (|ultimate-autopair-map-multi-config|)
      },
      space2 = { -- *ultimate-autopair-map-space2-config*
        enable = false,
        match = [[\k]],
        --what character activate
        conf = {},
        --contains extension config
        multi = false,
        --use multiple configs (|ultimate-autopair-map-multi-config|)
      },
      fastwarp = { -- *ultimate-autopair-map-fastwarp-config*
        enable = true,
        enable_normal = true,
        enable_reverse = true,
        hopout = false,
        --{(|)} > fastwarp > {(}|)
        map = "<A-e>", --string or table
        rmap = "<A-E>", --string or table
        cmap = "<A-e>", --string or table
        rcmap = "<A-E>", --string or table
        multiline = true,
        --(|) > fastwarp > (\n|)
        nocursormove = false,
        --makes the cursor not move (|)foo > fastwarp > (|foo)
        --disables multiline feature
        --only activates if prev char is start pair, otherwise fallback to normal
        do_nothing_if_fail = true,
        --add a module so that if fastwarp fails
        --then an `e` will not be inserted
        no_filter_nodes = { "string", "raw_string", "string_literals", "character_literal" },
        --which nodes to skip for tsnode filtering
        faster = false,
        --only enables jump over pair, goto end/next line
        --useful for the situation of:
        --{|}M.foo('bar') > {M.foo('bar')|}
        conf = {},
        --contains extension config
        multi = false,
        --use multiple configs (|ultimate-autopair-map-multi-config|)
      },
      close = { -- *ultimate-autopair-map-close-config*
        enable = true,
        map = "<A-)>", --string or table
        cmap = "<A-)>", --string or table
        conf = {},
        --contains extension config
        multi = false,
        --use multiple configs (|ultimate-autopair-map-multi-config|)
        do_nothing_if_fail = true,
        --add a module so that if close fails
        --then a `)` will not be inserted
      },
      tabout = { -- *ultimate-autopair-map-tabout-config*
        enable = false,
        map = "<c-l>", --string or table
        cmap = "<c-l>", --string or table
        conf = {},
        --contains extension config
        multi = false,
        --use multiple configs (|ultimate-autopair-map-multi-config|)
        hopout = false,
        -- (|) > tabout > ()|
        do_nothing_if_fail = true,
        --add a module so that if close fails
        --then a `\t` will not be inserted
      },
      extensions = { -- *ultimate-autopair-extensions-default-config*
        cmdtype = { skip = { "/", "?", "@", "-" }, p = 100 },
        filetype = { p = 90, nft = { "TelescopePrompt" }, tree = true },
        escape = { filter = true, p = 80 },
        utf8 = { p = 70 },
        tsnode = {
          p = 60,
          separate = {
            "comment",
            "string",
            "char",
            "character",
            "raw_string", --fish/bash/sh
            "char_literal",
            "string_literal", --c/cpp
            "string_value", --css
            "str_lit",
            "char_lit", --clojure/commonlisp
            "interpreted_string_literal",
            "raw_string_literal",
            "rune_literal", --go
            "quoted_attribute_value", --html
            "template_string", --javascript
            "LINESTRING",
            "STRINGLITERALSINGLE",
            "CHAR_LITERAL", --zig
            "string_literals",
            "character_literal",
            "line_comment",
            "block_comment",
            "nesting_block_comment", --d #62
          },
        },
        cond = { p = 40, filter = true },
        alpha = { p = 30, filter = false, all = false },
        suround = { p = 20 },
        fly = {
          other_char = { " " },
          nofilter = false,
          p = 10,
          undomapconf = {},
          undomap = nil,
          undocmap = nil,
          only_jump_end_pair = false,
        },
      },
      internal_pairs = { -- *ultimate-autopair-pairs-default-pairs*
        { "[", "]", fly = true, dosuround = true, newline = true, space = true },
        { "(", ")", fly = true, dosuround = true, newline = true, space = true },
        { "{", "}", fly = true, dosuround = true, newline = true, space = true },
        { '"', '"', suround = true, multiline = false },
        {
          "'",
          "'",
          suround = true,
          cond = function(fn) return not fn.in_lisp() or fn.in_string() end,
          alpha = true,
          nft = { "tex" },
          multiline = false,
        },
        {
          "`",
          "`",
          cond = function(fn) return not fn.in_lisp() or fn.in_string() end,
          nft = { "tex" },
          multiline = false,
        },
        { "``", "''", ft = { "tex" } },
        { "```", "```", newline = true, ft = { "markdown" } },
        { "<!--", "-->", ft = { "markdown", "html" }, space = true },
        { '"""', '"""', newline = true, ft = { "python" } },
        { "'''", "'''", newline = true, ft = { "python" } },
      },
      config_internal_pairs = { -- *ultimate-autopair-pairs-configure-default-pairs*
        --configure internal pairs
        --example:
        --{'{','}',suround=true},
      },
    },
  },
  {
    "windwp/nvim-ts-autotag",
    enabled = true,
    event = "VeryLazy",
    config = function()
      require("nvim-ts-autotag").setup {
        opts = {
          -- Defaults
          enable_close = true, -- Auto close tags
          enable_rename = true, -- Auto rename pairs of tags
          enable_close_on_slash = true, -- Auto close on trailing </
        },
        -- Also override individual filetype configs, these take priority.
        -- Empty by default, useful if one of the "opts" global settings
        -- doesn't work well in a specific filetype
      }
    end,
  },
}
