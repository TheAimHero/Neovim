return {
	"Dhanus3133/LeetBuddy.nvim",

	dependencies = { "plenary.nvim", "telescope.nvim" },
	config = function()
		require("leetbuddy").setup({
			domain = "com",
			language = "cpp",
		})
	end,
	cmd = { "LBQuestions", "LBQuestion", "LBReset", "LBTest", "LBSubmit" },
}
