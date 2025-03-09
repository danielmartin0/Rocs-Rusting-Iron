data:extend({
	{
		type = "double-setting",
		name = "rocs-rusting-iron-time-minutes",
		setting_type = "startup",
		default_value = 90,
		minimum_value = 0.25,
		maximum_value = 60 * 24 * 7 * 365,
	},
	{
		type = "bool-setting",
		name = "rocs-rusting-iron-engines-rust",
		setting_type = "startup",
		default_value = true,
	},
})
