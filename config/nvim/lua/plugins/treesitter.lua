return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    -- treesitter is an abstract syntax tree builder, installing this gives us better syntax highlighting
    local config = require("nvim-treesitter.configs")
    config.setup({
      ensure_installed = { "lua", "javascript", "rust" },
      highlight = { enable = true },
      indent = { enable = true },
    })
  end
}

