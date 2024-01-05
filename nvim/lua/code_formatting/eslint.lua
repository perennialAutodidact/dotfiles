local ok, eslint = pcall(require, "eslint")
if not ok then
	print("Error loading eslint plugin")
	return
end

-- eslint.setup({
-- 	bin = "eslint",
-- 	diagnostics = {
-- 		enable = true,
-- 		report_unused_disable_directives = false,
-- 		run_on = "type",
-- 	},
-- })
