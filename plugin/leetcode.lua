local leetcode = require(leetcode)

local function create_comands(cmd, callback, opts)
	vim.api.nvim_create_user_command(cmd, callback, opts or {})
end

local maping_cmd = {
	MakeLeetCodeSubimition = {  }
}
