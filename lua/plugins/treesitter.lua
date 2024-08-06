return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    -- treesitter
    local configs = require("nvim-treesitter.configs")
    configs.setup({
      auto_install = true,
      sync_install = false,
      highlight = { enable = true },
      indent = { enable = true },
      autotag = { enable = true, enable_rename = true },
    })
  end,
}
