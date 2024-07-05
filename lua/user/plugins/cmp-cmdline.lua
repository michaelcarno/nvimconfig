return {
  "hrsh7th/cmp-cmdline",
  event = "BufRead",
  opts = function()
    local cmp = require("cmp")
    cmp.setup.cmdline('/', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = 'buffer' }
      }
    })
    cmp.setup.cmdline(':', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = 'path' }
      }, {
        {
          name = 'cmdline',
          option = {
            ignore_cmds = { 'Man', '!' }
          }
        }
      })
    })
  end,
  config = function(_, opts)
    local cmp = require "cmp"
    vim.tbl_map(function(val) cmp.setup.cmdline(val.type, val) end, opts)
  end,





}
