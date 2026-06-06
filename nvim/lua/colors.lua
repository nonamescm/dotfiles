if vim.o.background == "light" then
	return require("light-colors")
else
	return require("dark-colors")
end
