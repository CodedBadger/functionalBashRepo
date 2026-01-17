-- =========================
-- Editor Options
-- =========================

vim.opt.number = true
vim.opt.relativenumber = true
-- vim.opt.cursorline = true

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.wrap = true

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.hlsearch = true

vim.opt.showmatch = true
vim.opt.clipboard = "unnamedplus"
vim.opt.background = "dark"
vim.opt.termguicolors = true
vim.opt.scrolloff = 8

vim.cmd("syntax enable")
-- vim.cmd("colorscheme industry")

-- =========================
-- Terminal Settings
-- =========================

-- Disable line numbers in terminal buffers
vim.api.nvim_create_autocmd("TermOpen", {
  pattern = "*",
  callback = function()
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
    vim.cmd("startinsert")
  end,
})

-- =========================
-- Smart Ctrl+\ Mapping
-- =========================

local function open_tree_and_terminal()
  -- Open file tree (netrw)
  vim.cmd("Lexplore")

  -- Look for an existing terminal buffer
  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    if vim.api.nvim_buf_is_loaded(buf) then
      if vim.api.nvim_buf_get_option(buf, "buftype") == "terminal" then
        -- If terminal is already visible, jump to it
        for _, win in ipairs(vim.api.nvim_list_wins()) do
          if vim.api.nvim_win_get_buf(win) == buf then
            vim.api.nvim_set_current_win(win)
            return
          end
        end

        -- Terminal exists but is hidden → show it
        vim.cmd("belowright split")
        vim.cmd("resize 12")
        vim.api.nvim_win_set_buf(0, buf)
        return
      end
    end
  end

  -- No terminal exists → create one
  vim.cmd("belowright split")
  vim.cmd("resize 12")
  vim.cmd("terminal")
end

vim.keymap.set(
  "n",
  "<C-\\>",
  open_tree_and_terminal,
  { noremap = true, silent = true }
)
