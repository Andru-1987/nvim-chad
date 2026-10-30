require "nvchad.autocmds"

vim.api.nvim_create_autocmd("BufWritePre", {
  group = vim.api.nvim_create_augroup("ForceUnixEOL", { clear = true }),
  pattern = "*",
  callback = function(args)
    local bo = vim.bo[args.buf]
    if not bo.modifiable or bo.binary or bo.buftype ~= "" then
      return
    end
    bo.fileformat = "unix"
    -- con saltos mixtos (CRLF + LF) nvim detecta ff=unix y los \r quedan
    -- como texto (^M); cambiar fileformat no los toca, hay que borrarlos
    local view = vim.fn.winsaveview()
    vim.cmd [[silent keepjumps keeppatterns %s/\r$//e]]
    vim.fn.winrestview(view)
  end,
  desc = "Forzar saltos de linea unix y quitar ^M",
})

vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    local arg = vim.fn.argv(0)
    if arg ~= "" and vim.fn.isdirectory(arg) == 1 then
      vim.cmd("NvimTreeToggle " .. vim.fn.fnameescape(vim.fn.fnamemodify(arg, ":p")))
    end
  end,
})
