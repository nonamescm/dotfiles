return function(hi_name, hi_table, force)
	local cmd_str

	if force == true then
		cmd_str = "hi! " .. hi_name
	else
		cmd_str = "hi " .. hi_name
	end

	for key, value in pairs(hi_table) do
		cmd_str = cmd_str .. " " .. key .. "=" .. value
	end

	vim.cmd(cmd_str)
end
