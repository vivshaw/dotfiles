local on_attach = function(client, bufnr)
  -- format on save
  if client.server_capabilities.documentFormattingProvider then
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = vim.api.nvim_create_augroup("Format", { clear = true }),
      buffer = bufnr,
      callback = function() vim.lsp.buf.format() end
    })
  end
end

-- TypeScript
vim.lsp.config('ts_ls', {
  on_attach = on_attach,
  filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
})
vim.lsp.enable('ts_ls')
