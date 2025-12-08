return {
  {
    "folke/snacks.nvim",
    opts = {
      terminal = {
        win = {
          style = "float",
          border = "rounded",

          width = 0.6,
          height = 0.6,
        },

        on_leave = "hide",
      },
    },

    keys = {
      {
        "<M-h>",
        function()
          require("snacks").terminal.toggle()
        end,
        desc = "Toggle Snack Terminal",
      },
      {
        "<leader>t",
        function()
          require("snacks").terminal.toggle()
        end,
        desc = "Toggle Snack Terminal (fallback)",
      },
    },
  },
}
