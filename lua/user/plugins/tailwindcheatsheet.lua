return {
"DanielVolchek/tailiscope.nvim",
event = "VeryLazy",
config = function()
require('telescope').setup({
	extensions = {
		tailiscope = {
			-- register to copy classes to on selection
			register = "*",
		 	-- indicates what picker opens when running Telescope tailiscope
			-- can be any file inside of docs dir but most useful opts are
			-- all, base, categories, classes
			-- These are also accesible by running Telescope tailiscope <picker>
			default = "base",
			-- icon indicates an item which can be opened in tailwind docs
			-- can be icon or false
			doc_icon = " ",
		  	-- if you would prefer to copy with/without class selector
		 	-- dot is maintained in display to differentiate class from other pickers
			no_dot = true,
			maps = {
				i = {
					back = "<C-h>",
					open_doc = "<C-o>",
				},
				n = {
					back = "b",
					open_doc = "od",
				},
			},
	}
}})
    require('telescope').load_extension('tailiscope')
end,
keys = {
 { "<leader>fm",  "<cmd>Telescope tailiscope<cr>", desc ="Tailscope" },
}
}
