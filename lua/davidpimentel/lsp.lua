vim.lsp.enable('luals')
vim.lsp.enable('ts_ls')
vim.lsp.enable('dartls')
vim.lsp.enable('astro-ls')
vim.lsp.enable('gopls')

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    if client:supports_method('textDocument/completion') then
      vim.opt.completeopt = { 'menu', 'menuone', 'noinsert', 'fuzzy', 'popup' }
      vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
      vim.keymap.set('i', '<C-Space>', function()
        vim.lsp.completion.get()
      end)
    end
  end,
})

local register_autoformat = function(client, buf)
  if client.supports_method("textDocument/formatting") then
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = buf,
      callback = function()
        vim.lsp.buf.format { async = false, id = client.id }
      end,
    })
  end
end

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    register_autoformat(client, ev.buf)
  end
})

-- some LSPs dynamically register capabilities after LspAttach, so check again if it supports formatting
-- https://neovim.io/doc/user/lsp.html#LspAttach
vim.lsp.handlers['client/registerCapability'] = (function(overridden)
  return function(err, res, ctx)
    local result = overridden(err, res, ctx)
    local client = vim.lsp.get_client_by_id(ctx.client_id)
    if not client then
      return
    end
    for bufnr, _ in pairs(client.attached_buffers) do
      register_autoformat(client, bufnr)
    end
    return result
  end
end)(vim.lsp.handlers['client/registerCapability'])

-- Diagnostics
vim.diagnostic.config({
  -- Use the default configuration
  -- virtual_lines = true

  -- Alternatively, customize specific options
  virtual_lines = {
    -- Only show virtual line diagnostics for the current cursor line
    current_line = true,
  },
})
