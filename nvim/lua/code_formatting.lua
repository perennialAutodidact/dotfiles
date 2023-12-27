-- local formatter_ok, formatter = pcall(require, "formatter")
-- if not formatter_ok then
--     print("Error loading formatter plugin")
--     return
-- end

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

augroup("__formatter__", { clear = true })
autocmd("BufWritePost", {
	group = "__formatter__",
	command = ":FormatWrite",
})

local function prettier()
    return {
        exe = 'prettier',
        args = {
            vim.fn.shellescape(vim.api.nvim_buf_get_name(0))
        },
        stdin = true,
    }
end

require("formatter").setup({
    logging = true,
    log_level = vim.log.levels.WARN,
    filetype = {
        javascript = { prettier },
        ['javascript.jsx'] = { prettier },
        typescript = { prettier },
        ['typescript.tsx'] = { prettier },
    }
})

