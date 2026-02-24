return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local colors = {
      red = "#FC5D7C",
      filled_red = "#FF6077",
      green = "#9ED072",
      filled_green = "#A7DF78",
      blue = "#76CCE0",
      filled_blue = "#85D3F2",
      purple = "#B39DF3",
      fg = "#E2E2E3",
      yellow = "#E7C664",
      grey = "#7F8490",
      orange = "#F39660",
      grey_dim = "#",
      black = "#080808",
    }

    local bubbles_theme = {
      normal = {
        a = { fg = colors.black, bg = colors.red },
        b = { fg = colors.fg, bg = colors.grey_dim },
        c = { fg = colors.fg, bg = "none" },
      },

      insert = { a = { fg = colors.black, bg = colors.filled_blue } },
      visual = { a = { fg = colors.black, bg = colors.purple } },
      replace = { a = { fg = colors.black, bg = colors.orange } },

      inactive = {
        a = { fg = colors.grey, bg = colors.black },
        b = { fg = colors.grey, bg = colors.black },
        c = { fg = colors.grey_dim, bg = "none" },
      },
    }

    require("lualine").setup({
      options = {
        theme = bubbles_theme,
        component_separators = "",
        section_separators = { left = "", right = "" },
        globalstatus = false,
      },
      sections = {
        lualine_a = { { "mode", separator = { left = "" }, right_padding = 2 } },
        lualine_b = { "branch", "filename" },
        lualine_c = { "%=" },
        lualine_x = {},
        lualine_y = { "filetype", "progress" },
        lualine_z = {
          { "location", separator = { right = "" }, left_padding = 2 },
        },
      },
      inactive_sections = {
        lualine_a = { "filename" },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = { "location" },
      },
      tabline = {},
      extensions = {},
    })
    vim.opt.laststatus = 0
  end,
}
