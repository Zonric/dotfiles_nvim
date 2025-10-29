require("image").setup({
	integrations = {
		mini = false,
		markdown = {
			enabled = true,
			clear_in_insert_mode = true,
			only_render_image_at_cursor = true,
		},
		html = {
			enabled = true,
			clear_in_insert_mode = true,
			only_render_image_at_cursor = true,
		},
	},
	max_height = 8,
})
