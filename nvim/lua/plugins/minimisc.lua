return {
  "nvim-mini/mini.misc",
  config = function()
    local misc = require("mini.misc")
    misc.setup({})

    -- misc.setup_termbg_sync() -- commented out to allow transparency
  end,
}
