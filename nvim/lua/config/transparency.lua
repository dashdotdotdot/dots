-- ~/.config/nvim/lua/config/transparency.lua
local M = {}

function M.setup()
  -- Set transparency only for the active window
  vim.api.nvim_create_autocmd({ "WinEnter", "BufEnter" }, {
    callback = function()
      vim.cmd("highlight Normal guibg=none ctermbg=none")
      vim.cmd("highlight NormalNC guibg=none ctermbg=none")
      vim.cmd("highlight EndOfBuffer guibg=none ctermbg=none")
      vim.cmd("highlight SignColumn guibg=none ctermbg=none")
      vim.cmd("highlight StatusLine guibg=none ctermbg=none")
      vim.cmd("highlight VertSplit guibg=none ctermbg=none")
    end,
  })

  -- Optionally make inactive windows less transparent
  vim.api.nvim_create_autocmd({ "WinLeave" }, {
    callback = function()
      vim.cmd("highlight NormalNC guibg=#101010 ctermbg=none")
    end,
  })
end

return M
