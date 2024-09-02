return {
	"andweeb/presence.nvim",
	config = function()
		require("presence").setup({
			-- General options
			auto_update = true, -- Automatically update activity based on autocmd events
			neovim_image_text = "The One True Text Editor", -- Text displayed when hovered over the Neovim image
			main_image = "neovim", -- Main image display (either "neovim" or "file")
			client_id = "793271441293967371", -- Use your own Discord application client id (not recommended)
			log_level = nil, -- Log messages at or above this level (one of the following: "debug", "info", "warn", "error")
			debounce_timeout = 10, -- Number of seconds to debounce events (or calls to `:lua package.loaded.presence:update(<filename>, true)`)
			enable_line_number = false, -- Displays the current line number instead of the current project
			blacklist = { ".env" }, -- A list of strings or Lua patterns that disable Rich Presence if the current file name, path, or workspace matches
			buttons = true, -- Configure Rich Presence button(s), either a boolean to enable/disable, a static table (`{{ label = "<label>", url = "<url>" }, ...}`, or a function(buffer: string, repo_url: string|nil): table)
			file_assets = {}, -- Custom file asset definitions keyed by file names and extensions (see default config at `lua/presence/file_assets.lua` for reference)
			show_time = true, -- Show the timer

			-- Rich Presence text options
			editing_text = function(filename)
				return string.format("Editing %s", vim.fn.fnamemodify(filename, ":t"))
			end, -- Display "Editing <filename>" when editing a file
			file_explorer_text = "Browsing files", -- Display "Browsing files" when in a file explorer
			git_commit_text = "Committing changes", -- Display "Committing changes" when committing changes in git
			plugin_manager_text = "Managing plugins", -- Display "Managing plugins" when managing plugins
			reading_text = function(filename)
				return string.format("Reading %s", vim.fn.fnamemodify(filename, ":t"))
			end, -- Display "Reading <filename>" when reading a file
			workspace_text = function(project_name, filename)
				if project_name then
					return string.format("Working on %s", project_name)
				else
					return string.format("Working on %s", vim.fn.fnamemodify(filename, ":p:h:t"))
				end
			end, -- Display "Working on <project_name>" or directory name
			line_number_text = "Line %s out of %s", -- Format string rendered when `enable_line_number` is set to true
		})

		vim.api.nvim_set_keymap(
			"n",
			"<leader>pu",
			"<CMD>lua package.loaded.presence:update()<CR>",
			{ noremap = true, silent = true }
		)
	end,
}
