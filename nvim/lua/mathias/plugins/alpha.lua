return {
  "goolord/alpha-nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    -- Headers
    local header_files = vim.fn.globpath(vim.fn.stdpath("config").."/custom/", "*.ascii", false, true)

    local header_lines = { "¯\\_(ツ)_/¯" }
    if #header_files > 0 then
      math.randomseed(os.time())
      local chosen_header = header_files[math.random(#header_files)]
      local ok, lines = pcall(vim.fn.readfile, chosen_header)
      if ok then
        header_lines = lines
      else
        header_lines = { "Failed to read header file: " .. chosen_header }
      end
    end
    dashboard.section.header.val = header_lines

    -- Quotes
    local quotes_path = vim.fn.stdpath("config") .. "/custom/quotes.txt"
    local quote_lines = {}
    local ok, quotes = pcall(vim.fn.readfile, quotes_path)
    if ok and #quotes > 0 then
      math.randomseed(os.time() + 42)
      quote_lines = { quotes[math.random(#quotes)] }
    else
      quote_lines = { "*no quote*" }
    end
    dashboard.section.footer.val = quote_lines

    -- Buttons
    dashboard.section.buttons.val = {
	dashboard.button("n", "󰈔  New file", ":ene <BAR> startinsert<CR>"),
	dashboard.button("h", "  /home/", ":e ~<CR>"),
	dashboard.button("l", "󰴥  LeetCode", ":Leet<CR>"),
	dashboard.button("s", "  Settings", ":e ~/.config/nvim<CR>"),
	dashboard.button("q", "  Quit", ":q<CR>")
    }

    dashboard.section.buttons.opts.hl = "Keyword"

    alpha.setup(dashboard.opts)
  end,
}
