require("mathias.settings")
require("mathias.lazy")
require("mathias.autocmds")

vim.api.nvim_create_autocmd("FileType", {
	pattern = "html",
	callback = function()
		-- Core indent options
		vim.opt_local.autoindent = false
		vim.opt_local.smartindent = false
		vim.opt_local.cindent = false
		vim.opt_local.indentexpr = ""
		vim.opt_local.indentkeys = ""

    		-- Optional: disable filetype indent plugin
    		vim.cmd("setlocal nocindent nosmartindent noautoindent indentexpr= indentkeys=")
	end
})

vim.cmd.colorscheme("catppuccin")
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
