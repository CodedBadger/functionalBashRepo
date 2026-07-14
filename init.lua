-- Set <Space> as the leader key (must happen before plugins are loaded)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- ==========================================
-- General Settings
-- ==========================================
local opt = vim.opt

-- Appearance
vim.cmd("colorscheme slate")   -- Set the built-in slate color scheme

opt.number = true              -- Show absolute line numbers
opt.relativenumber = true      -- Show relative line numbers (great for jumping)
opt.termguicolors = true       -- Enable 24-bit RGB colors for modern themes
opt.wrap = false               -- Disable line wrap
opt.cursorline = true          -- Highlight the current line

-- Indentation Guides
opt.list = true                -- Show invisible characters
opt.listchars = {
    tab = "│ ",                -- Draw a vertical bar for tabs
    leadmultispace = "│ ",     -- Draw a vertical bar for leading spaces (matches 2-space indent)
    trail = "·",               -- Show dots for trailing whitespace
}

-- Behavior
opt.mouse = "a"                -- Enable mouse support in all modes
opt.clipboard = "unnamedplus"  -- Sync Neovim clipboard with the Windows system clipboard
opt.ignorecase = true          -- Ignore case when searching
opt.smartcase = true           -- Don't ignore case if search term contains a capital letter
opt.hlsearch = false           -- Don't leave search terms highlighted after searching
opt.updatetime = 250           -- Decrease update time for faster completion and snappier UI

-- Indentation
opt.tabstop = 2                -- Number of spaces a <Tab> counts for
opt.shiftwidth = 2             -- Number of spaces to use for each step of (auto)indent
opt.expandtab = true           -- Convert tabs to spaces
opt.smartindent = true         -- Auto-indent new lines intelligently

-- Window Splitting
opt.splitbelow = true          -- Put new horizontal splits below the current window
opt.splitright = true          -- Put new vertical splits to the right of the current window

-- ==========================================
-- Toggle Terminal Logic
-- ==========================================
local term_buf = nil
local term_win = nil

local function toggle_terminal()
    -- If the terminal window is open and valid, hide it
    if term_win and vim.api.nvim_win_is_valid(term_win) then
        vim.api.nvim_win_hide(term_win)
    else
        -- Otherwise, create a new split at the bottom
        vim.cmd("botright 15split")
        term_win = vim.api.nvim_get_current_win()
        
        -- If we already have a running terminal buffer, attach it to the new window
        if term_buf and vim.api.nvim_buf_is_valid(term_buf) then
            vim.api.nvim_win_set_buf(term_win, term_buf)
        else
            -- If no buffer exists, start a new terminal session
            vim.cmd("terminal")
            term_buf = vim.api.nvim_get_current_buf()
            
            -- Clean up appearance for the terminal buffer
            vim.opt_local.number = false
            vim.opt_local.relativenumber = false
            vim.opt_local.signcolumn = "no"
            vim.opt_local.list = false -- Disable indentation guides in terminal
        end
        
        -- Automatically enter insert mode when opening
        vim.cmd("startinsert")
    end
end

-- Map the toggle function to Normal ("n") and Terminal ("t") modes
vim.keymap.set({"n", "t"}, "<C-/>", toggle_terminal, { desc = "Toggle Terminal" })
vim.keymap.set({"n", "t"}, "<C-_>", toggle_terminal, { desc = "Toggle Terminal (Fallback)" })

-- ==========================================
-- Keymaps
-- ==========================================

-- Exit Terminal Mode
-- By default, Neovim traps you in the terminal. This lets you use `Esc` to get back to Normal mode.
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Window Navigation
-- Use Ctrl + hjkl to move between split windows easily
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Go to left window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Go to lower window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Go to upper window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Go to right window" })

-- Clear Search Highlights
-- Press <Esc> in normal mode to clear lingering search highlights
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlights" })
