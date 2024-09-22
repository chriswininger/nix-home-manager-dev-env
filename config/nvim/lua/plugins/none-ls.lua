return {
  "nvimtools/none-ls.nvim",
  config = function()
    -- this is required as null-ls for historical reasons, it's a fork of deprecated project
    local none_ls = require('null-ls')

    none_ls.setup({
      -- you need to install stylual, prettier, etc.
      -- with mason, still
      sources = {
        none_ls.builtins.formatting.stylua,
        none_ls.builtins.formatting.prettier,
        -- eslint not working
        -- none_ls.builtins.diagnostics.eslint_d,
      }
    })
  end
}
