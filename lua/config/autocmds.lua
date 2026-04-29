-- Transparência sempre que trocar colorscheme
vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function()
    require("config.transparent").apply()
  end,
})

-- Transparência quando diagnostics mudam (erro/warn muda o bufferline)
vim.api.nvim_create_autocmd("DiagnosticChanged", {
  callback = function()
    -- pequeno delay ajuda porque bufferline atualiza highlights após o evento
    vim.defer_fn(function()
      require("config.transparent").apply()
    end, 10)
  end,
})

-- Aplica o tema do Hypr depois que o LazyVim terminar de carregar
vim.api.nvim_create_autocmd("User", {
  pattern = "LazyVimStarted",
  once = true,
  callback = function()
    require("config.theme").apply()
  end,
})

-- Reagir quando o Hypr trocar o tema
local theme_file = vim.fn.expand("~/.config/hypr/current_theme.txt")

vim.fn.jobstart({
  "sh",
  "-c",
  "while inotifywait -e close_write " .. theme_file .. "; do echo changed; done",
}, {
  on_stdout = function()
    vim.schedule(function()
      require("config.theme").apply()
    end)
  end,
})

local function apply_transparent()
  require("config.transparent").apply()
end

vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function()
    apply_transparent()
    vim.defer_fn(apply_transparent, 50) -- pega plugins que re-setam highlights depois
    vim.defer_fn(apply_transparent, 200) -- pega os mais “tardios”
  end,
})
