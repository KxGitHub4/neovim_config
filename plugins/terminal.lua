return {
	"akinsho/toggleterm.nvim",
	opts = {
		-- Size of the terminal window (in number of lines)
		size = 20, -- You can set it to a specific number or a percentage (e.g., 0.5 for 50%)

		-- Open terminal in a floating window
		open_mapping = [[<c-\>]], -- Keybind to open the terminal, e.g., Ctrl+\

		-- Terminal window direction
		direction = "horizontal", -- Options: 'horizontal', 'vertical', 'float'

		-- Whether to persist terminals across sessions
		persist_mode = false, -- Set to true if you want to keep terminals across sessions

		-- Automatically start terminal for specific file types
		auto_scroll = true, -- Automatically scroll terminal when new output arrives
	},

	config = function()
		require("toggleterm").setup()
	end,
}
