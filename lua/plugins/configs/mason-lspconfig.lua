return function(_, opts)
  -- require("mason-lspconfig").setup(opts)

  -- добавляем после версии 2.0 подгрузку конфигов всех лсп сразу
  -- а не через default function

  for i, val in ipairs(require("mason-lspconfig").get_installed_servers()) do
    require("astronvim.utils.lsp").setup(val)
  end

  require("astronvim.utils").event "MasonLspSetup"
end
