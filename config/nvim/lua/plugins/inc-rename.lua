-- in conunction with lsp allows you to rename functions and variables, updating instances of it
return {
  "smjonas/inc-rename.nvim",
  config = function()
    require("inc_rename").setup()
  end,
}

