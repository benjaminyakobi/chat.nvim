local M = {}

function M.setup(opts)
  opts = opts or {}

  vim.keymap.set("n", "<Leader>81", function()
    if opts.name then
      print("chat: hello world from " .. opts.name)
    else
      print("chat: hello world")
    end
  end, { desc = "Say Hello World" })
end

return M
