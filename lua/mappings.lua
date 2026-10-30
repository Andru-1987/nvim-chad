require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- Normal Mode: Move line down/up
map("n", "<A-j>", ":m .+1<CR>==", { desc = "Move line down" })
map("n", "<A-k>", ":m .-2<CR>==", { desc = "Move line up" })

-- Visual Mode: Move selection down/up
map("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
map("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })


-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- terminales en el root de nvim-tree (si esta cargado), si no en el cwd
local function term_cwd()
  local ok, core = pcall(require, "nvim-tree.core")
  local root = ok and core.get_cwd() or nil
  return root or vim.fn.getcwd()
end

local function term_opts(opts)
  opts.termopen_opts = { cwd = term_cwd() }
  return opts
end

map("n", "<leader>h", function()
  require("nvchad.term").new(term_opts { pos = "sp" })
end, { desc = "terminal new horizontal term" })

map("n", "<leader>v", function()
  require("nvchad.term").new(term_opts { pos = "vsp" })
end, { desc = "terminal new vertical term" })

map({ "n", "t" }, "<A-v>", function()
  require("nvchad.term").toggle(term_opts { pos = "vsp", id = "vtoggleTerm" })
end, { desc = "terminal toggleable vertical term" })

map({ "n", "t" }, "<A-h>", function()
  require("nvchad.term").toggle(term_opts { pos = "sp", id = "htoggleTerm" })
end, { desc = "terminal toggleable horizontal term" })

map({ "n", "t" }, "<A-i>", function()
  require("nvchad.term").toggle(term_opts { pos = "float", id = "floatTerm" })
end, { desc = "terminal toggle floating term" })

