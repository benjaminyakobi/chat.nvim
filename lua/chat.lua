local M = {}

function M.setup(opts)
	opts = opts or {}

	vim.keymap.set("n", "<Leader>h", function()
		if opts.name then
			print("chat: hello, " .. opts.name)
		else
			print("hello")
		end
	end)
end

return M
