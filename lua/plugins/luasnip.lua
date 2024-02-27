return {
  "L3MON4D3/LuaSnip",
  opts = function(plugin, opts)
    require "astronvim.plugins.configs.luasnip"(plugin, opts) -- include the default astronvim config that calls the setup call
    require("luasnip.loaders.from_vscode").lazy_load {
      paths = {
        "./snippets",
        -- "~/AppData/Local/nvim/lua/snippets/",
        --	"C:/snippets"
      },
    } -- load snippets paths
  end,
}
