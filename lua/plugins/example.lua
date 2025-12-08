return {
  {
    {
      "folke/tokyonight.nvim",
      opts = {
        style = "night",
        transparent = true,
        styles = { sidebars = "transparent", floats = "transparent", statusline = "transparent" },

        on_colors = function(colors)
          colors.bg_statusline = "NONE"
        end,
      },
    },
  },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyonight",
    },
  },

  { "ellisonleao/gruvbox.nvim" },

  {
    "folke/trouble.nvim",
    enabled = true,
  },

  {
    "hrsh7th/nvim-cmp",
    dependencies = { "hrsh7th/cmp-emoji" },
    opts = function(_, opts)
      table.insert(opts.sources, { name = "emoji" })
    end,
  },

  {
    "nvim-telescope/telescope.nvim",
    keys = {
      {
        "<leader>fp",
        function()
          require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root })
        end,
        desc = "Find Plugin File",
      },
    },
    opts = {
      defaults = {
        layout_strategy = "horizontal",
        layout_config = { prompt_position = "top" },
        sorting_strategy = "ascending",
        winblend = 0,
      },
    },
  },

  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        pyright = {},
      },
    },
  },

  { import = "lazyvim.plugins.extras.lang.typescript" },

  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        tsserver = {},
      },
    },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "bash",
        "html",
        "javascript",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "regex",
        "tsx",
        "typescript",
        "vim",
        "yaml",
      },
    },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, { "tsx", "typescript" })
    end,
  },

  {
    "nvim-lualine/lualine.nvim",
    opts = {
      sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {
          "filename",
        },
        lualine_x = {
          {
            "diagnostics",
            sources = { "nvim_lsp" },
            sections = { "error", "warn" },
            colored = false,
            symbols = { error = "", warn = "" },
          },
        },
        lualine_y = {},
        lualine_z = {},
      },
      options = {
        globalstatus = true,
        component_separators = "",
        section_separators = "",
        theme = "tokyonight",
      },
    },
  },

  { import = "lazyvim.plugins.extras.lang.json" },

  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        "stylua",
        "shellcheck",
        "shfmt",
        "flake8",
      },
    },
  },

  {
    "folke/snacks.nvim",
    opts = {
      indent = { enabled = false },
    },
  },

  {
    "akinsho/bufferline.nvim",
    keys = {

      { "<Tab>", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
    },
    opts = {
      options = {
        indicator = { style = "none" },
        separator_style = "none",
        show_tab_indicators = false,
        enforce_regular_tabs = true,
        always_show_bufferline = false,
      },
    },
  },
}
