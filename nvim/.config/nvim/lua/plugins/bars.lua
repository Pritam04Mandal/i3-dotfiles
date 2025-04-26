return {
  'romgrk/barbar.nvim',
  dependencies = {
    'lewis6991/gitsigns.nvim',     -- OPTIONAL: for git status
    'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
  },
  init = function() vim.g.barbar_auto_setup = false end,
  opts = {
    -- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
    animation = true,
    -- insert_at_start = true,
    -- …etc.
  },
  config = function()
    require("bufferline").setup({
      highlights = {
        fill = { bg = "none" },            -- Transparent background for the entire tabline
        background = { bg = "none" },      -- Inactive buffers
        buffer_visible = { bg = "none" },  -- Visible but not active buffers
        buffer_selected = { bg = "none" }, -- Active buffer
      },
    })
  end,
  version = '^1.0.0', -- optional: only update when a new 1.x version is released
}
