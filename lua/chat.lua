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
  vim.keymap.set("n", "<Leader>82", M.show_chat_box, { desc = "Open chat box" })
  vim.keymap.set("n", "<Leader>83", M.close_chat_box, { desc = "Close chat box" })
end

function M.show_chat_box()
  local buf = vim.api.nvim_create_buf(false, true)

  local width = math.min(80, vim.o.columns - 4)
  local height = math.min(10, vim.o.lines - 4)
  local row = math.floor((vim.o.lines - height) / 2)
  local col = math.floor((vim.o.columns - width) / 2)

  M.chat_win_id = vim.api.nvim_open_win(buf, true, {
    relative = "editor",
    row = row,
    col = col,
    width = width,
    height = height,
    style = "minimal",
    border = "rounded",
    title = " Chat Box ",
    title_pos = "center",
  })

  vim.api.nvim_set_option_value("number", true, { win = M.chat_win_id })
end

function M.close_chat_box()
  if M.chat_win_id then
    vim.api.nvim_win_close(M.chat_win_id, true)
    M.chat_win_id = nil
  else
    print("no open window")
  end
end

return M
