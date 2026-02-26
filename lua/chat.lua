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

  vim.keymap.set("v", "82", function()
    M.show_chat_box(true)
  end, { desc = "Open selected chat box" })
  vim.keymap.set("n", "<Leader>82", function()
    M.show_chat_box(false)
  end, { desc = "Open clean chat box" })
  vim.keymap.set("n", "<Leader>83", M.close_chat_box, { desc = "Close chat box" })
end

function M.show_chat_box(selection)
  -- Get selected lines
  local lines = {}
  if selection then
    lines = M.get_visual_selection()
  end

  -- Create new buffer
  local new_buf = vim.api.nvim_create_buf(false, true)

  -- Set lines into new buffer
  vim.api.nvim_buf_set_lines(new_buf, 0, -1, false, lines)

  -- Calc window dimensions
  local width = math.min(80, vim.o.columns - 4)
  local height = math.min(10, vim.o.lines - 4)
  local row = math.floor((vim.o.lines - height) / 2)
  local col = math.floor((vim.o.columns - width) / 2)

  -- Open floating window
  M.chat_win_id = vim.api.nvim_open_win(new_buf, true, {
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

function M.get_visual_selection()
  -- Get start and end positions
  local _, s_line, s_col, _ = unpack(vim.fn.getpos("v"))
  local _, e_line, e_col, _ = unpack(vim.fn.getpos("."))

  -- Ensure start is before end for selection logic
  if s_line > e_line or (s_line == e_line and s_col > e_col) then
    s_line, e_line = e_line, s_line
    s_col, e_col = e_col, s_col
  end

  -- This returns the selection where the end is the cursor position
  -- return vim.api.nvim_buf_get_text(0, s_line - 1, s_col - 1, e_line - 1, e_col, {})

  -- This return the selection of the whole line (not the cursor position)
  return vim.api.nvim_buf_get_lines(0, s_line - 1, e_line, false)
end
return M
