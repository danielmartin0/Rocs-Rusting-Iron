local quality_mod_utils = require("quality-mod-utils")

local derusting_material = (mods["aai-industry"] or mods["Glass"]) and "sand" or "stone"
local AAI = mods["aai-industry"]

-- == Derusting recipes ==--

data:extend({
	{
		type = "recipe",
		name = "rocs-rusting-iron-iron-plate-derusting",
		icon = "__Rocs-Rusting-Iron__/graphics/icons/iron-plate-derust.png",
		icon_size = 64,
		order = "e[derusting]-a[derust-iron-plate]",
		enabled = true,
		subgroup = "derusting",
		category = "crafting",
		energy_required = 1 / 4,
		ingredients = {
			{
				type = "item",
				name = "rocs-rusting-iron-iron-plate-rusty",
				amount = 1,
				ignored_by_stats = 1,
			},
			{
				type = "item",
				name = derusting_material,
				amount = 1,
			},
		},
		results = {
			{
				type = "item",
				name = "iron-plate",
				amount = 1,
				ignored_by_productivity = 1,
				ignored_by_stats = 1,
			},
		},
		allow_quality = false,
		result_is_always_fresh = true,
		allow_decomposition = false,
		allow_as_intermediate = false,
		always_show_made_in = true,
		auto_recycle = false,
	},
	{
		type = "recipe",
		name = "rocs-rusting-iron-iron-gear-wheel-derusting",
		icon = "__Rocs-Rusting-Iron__/graphics/icons/iron-gear-wheel-derust.png",
		icon_size = 64,
		order = "e[derusting]-b[derust-iron-gear-wheel]",
		enabled = true,
		subgroup = "derusting",
		category = "crafting",
		energy_required = 1 / 4,
		ingredients = {
			{
				type = "item",
				name = "rocs-rusting-iron-iron-gear-wheel-rusty",
				amount = 1,
				ignored_by_stats = 1,
			},
			{
				type = "item",
				name = derusting_material,
				amount = 1,
			},
		},
		results = {
			{
				type = "item",
				name = "iron-gear-wheel",
				amount = 1,
				ignored_by_productivity = 1,
				ignored_by_stats = 1,
			},
		},
		allow_quality = false,
		result_is_always_fresh = true,
		allow_decomposition = false,
		allow_as_intermediate = false,
		always_show_made_in = true,
		auto_recycle = false,
	},
	{
		type = "recipe",
		name = "rocs-rusting-iron-iron-stick-derusting",
		icon = "__Rocs-Rusting-Iron__/graphics/icons/iron-stick-derust.png",
		icon_size = 64,
		order = "e[derusting]-c[derust-iron-stick]",
		enabled = false,
		subgroup = "derusting",
		category = "crafting",
		energy_required = 1 / 4,
		ingredients = {
			{
				type = "item",
				name = "rocs-rusting-iron-iron-stick-rusty",
				amount = 1,
				ignored_by_stats = 1,
			},
			{
				type = "item",
				name = derusting_material,
				amount = 1,
			},
		},
		results = {
			{
				type = "item",
				name = "iron-stick",
				amount = 1,
				ignored_by_productivity = 1,
				ignored_by_stats = 1,
			},
		},
		allow_quality = false,
		result_is_always_fresh = true,
		allow_decomposition = false,
		allow_as_intermediate = false,
		always_show_made_in = true,
		auto_recycle = false,
	},
})

if settings.startup["rocs-rusting-iron-engines-rust"].value then
	data:extend({
		{
			type = "recipe",
			name = AAI and "rocs-rusting-iron-motor-derusting" or "rocs-rusting-iron-engine-unit-derusting",
			icon = "__Rocs-Rusting-Iron__/graphics/icons/engine-unit-derust.png",
			icon_size = 64,
			order = AAI and "e[derusting]-d[derust-motor]" or "e[derusting]-d[derust-engine-unit]",
			enabled = false,
			subgroup = "derusting",
			category = "crafting",
			energy_required = AAI and 1.5 or 2.5,
			ingredients = {
				{
					type = "item",
					name = AAI and "rocs-rusting-iron-motor-rusty" or "rocs-rusting-iron-engine-unit-rusty",
					amount = 1,
					ignored_by_stats = 1,
				},
				{
					type = "item",
					name = derusting_material,
					amount = 3,
				},
			},
			results = {
				{
					type = "item",
					name = AAI and "motor" or "engine-unit",
					amount = 1,
					ignored_by_productivity = 1,
					ignored_by_stats = 1,
				},
			},
			allow_quality = false,
			result_is_always_fresh = true,
			allow_decomposition = false,
			allow_as_intermediate = false,
			always_show_made_in = true,
			auto_recycle = false,
		},
	})
end

-- == Chemical derusting recipes ==--

data:extend({
	{
		type = "recipe",
		name = "rocs-rusting-iron-iron-plate-chemical-derusting",
		icons = {
			{
				icon = "__Rocs-Rusting-Iron__/graphics/icons/iron-plate-derust.png",
				icon_size = 64,
				scale = 0.65,
				shift = { 2, 2 },
				draw_background = true,
			},
			{
				icon = "__base__/graphics/icons/fluid/sulfuric-acid.png",
				icon_size = 64,
				scale = 0.45,
				shift = { -11, -11 },
				draw_background = true,
			},
		},
		order = "e[derusting]-a[chemical-derust-iron-plate]",
		enabled = true,
		subgroup = "derusting",
		category = "chemistry",
		energy_required = 1 / 4,
		ingredients = {
			{
				type = "item",
				name = "rocs-rusting-iron-iron-plate-rusty",
				amount = 1,
				ignored_by_stats = 1,
			},
			{
				type = "fluid",
				name = "sulfuric-acid",
				amount = 10,
			},
			{
				type = "fluid",
				name = "water",
				amount = 30,
			},
		},
		results = {
			{
				type = "item",
				name = "iron-plate",
				amount = 1,
				ignored_by_productivity = 1,
				ignored_by_stats = 1,
			},
		},
		crafting_machine_tint = {
			primary = {
				r = 0.7,
				g = 0.7,
				b = 0.1,
			},
			secondary = {
				r = 0.8,
				g = 0.8,
				b = 0.1,
			},
			tertiary = {
				r = 0.7,
				g = 0.7,
				b = 0.1,
			},
		},
		allow_quality = false,
		result_is_always_fresh = true,
		allow_decomposition = false,
		allow_as_intermediate = false,
		always_show_made_in = true,
		auto_recycle = false,
	},
	{
		type = "recipe",
		name = "rocs-rusting-iron-iron-gear-wheel-chemical-derusting",
		icons = {
			{
				icon = "__Rocs-Rusting-Iron__/graphics/icons/iron-gear-wheel-derust.png",
				icon_size = 64,
				scale = 0.65,
				shift = { 2, 2 },
				draw_background = true,
			},
			{
				icon = "__base__/graphics/icons/fluid/sulfuric-acid.png",
				icon_size = 64,
				scale = 0.45,
				shift = { -11, -11 },
				draw_background = true,
			},
		},
		order = "e[derusting]-b[chemical-derust-iron-gear-wheel]",
		enabled = true,
		subgroup = "derusting",
		category = "chemistry",
		energy_required = 1 / 4,
		ingredients = {
			{
				type = "item",
				name = "rocs-rusting-iron-iron-gear-wheel-rusty",
				amount = 1,
				ignored_by_stats = 1,
			},
			{
				type = "fluid",
				name = "sulfuric-acid",
				amount = 10,
			},
			{
				type = "fluid",
				name = "water",
				amount = 30,
			},
		},
		results = {
			{
				type = "item",
				name = "iron-gear-wheel",
				amount = 1,
				ignored_by_productivity = 1,
				ignored_by_stats = 1,
			},
		},
		crafting_machine_tint = {
			primary = {
				r = 0.7,
				g = 0.7,
				b = 0.1,
			},
			secondary = {
				r = 0.8,
				g = 0.8,
				b = 0.1,
			},
			tertiary = {
				r = 0.7,
				g = 0.7,
				b = 0.1,
			},
		},
		allow_quality = false,
		result_is_always_fresh = true,
		allow_decomposition = false,
		allow_as_intermediate = false,
		always_show_made_in = true,
		auto_recycle = false,
	},
	{
		type = "recipe",
		name = "rocs-rusting-iron-iron-stick-chemical-derusting",
		icons = {
			{
				icon = "__Rocs-Rusting-Iron__/graphics/icons/iron-stick-derust.png",
				icon_size = 64,
				scale = 0.65,
				shift = { 2, 2 },
				draw_background = true,
			},
			{
				icon = "__base__/graphics/icons/fluid/sulfuric-acid.png",
				icon_size = 64,
				scale = 0.45,
				shift = { -11, -11 },
				draw_background = true,
			},
		},
		order = "e[derusting]-c[chemical-derust-iron-stick]",
		enabled = false,
		subgroup = "derusting",
		category = "chemistry",
		energy_required = 1 / 4,
		ingredients = {
			{
				type = "item",
				name = "rocs-rusting-iron-iron-stick-rusty",
				amount = 1,
				ignored_by_stats = 1,
			},
			{
				type = "fluid",
				name = "sulfuric-acid",
				amount = 10,
			},
			{
				type = "fluid",
				name = "water",
				amount = 30,
			},
		},
		results = {
			{
				type = "item",
				name = "iron-stick",
				amount = 1,
				ignored_by_productivity = 1,
				ignored_by_stats = 1,
			},
		},
		crafting_machine_tint = {
			primary = {
				r = 0.7,
				g = 0.7,
				b = 0.1,
			},
			secondary = {
				r = 0.8,
				g = 0.8,
				b = 0.1,
			},
			tertiary = {
				r = 0.7,
				g = 0.7,
				b = 0.1,
			},
		},
		allow_quality = false,
		result_is_always_fresh = true,
		allow_decomposition = false,
		allow_as_intermediate = false,
		always_show_made_in = true,
		auto_recycle = false,
	},
})

if settings.startup["rocs-rusting-iron-engines-rust"].value then
	data:extend({
		{
			type = "recipe",
			name = AAI and "rocs-rusting-iron-motor-chemical-derusting"
				or "rocs-rusting-iron-engine-unit-chemical-derusting",
			icons = {
				{
					icon = "__Rocs-Rusting-Iron__/graphics/icons/engine-unit-derust.png",
					icon_size = 64,
					scale = 0.65,
					shift = { 2, 2 },
					draw_background = true,
				},
				{
					icon = "__base__/graphics/icons/fluid/sulfuric-acid.png",
					icon_size = 64,
					scale = 0.45,
					shift = { -11, -11 },
					draw_background = true,
				},
			},
			order = AAI and "e[derusting]-d[chemical-derust-motor]" or "e[derusting]-d[chemical-derust-engine-unit]",
			enabled = false,
			subgroup = "derusting",
			category = "chemistry",
			energy_required = AAI and 1.5 or 2.5,
			ingredients = {
				{
					type = "item",
					name = AAI and "rocs-rusting-iron-motor-rusty" or "rocs-rusting-iron-engine-unit-rusty",
					amount = 1,
					ignored_by_stats = 1,
				},
				{
					type = "fluid",
					name = "sulfuric-acid",
					amount = 30,
				},
				{
					type = "fluid",
					name = "water",
					amount = 30,
				},
			},
			results = {
				{
					type = "item",
					name = AAI and "motor" or "engine-unit",
					amount = 1,
					ignored_by_productivity = 1,
					ignored_by_stats = 1,
				},
			},
			crafting_machine_tint = {
				primary = {
					r = 0.7,
					g = 0.7,
					b = 0.1,
				},
				secondary = {
					r = 0.8,
					g = 0.8,
					b = 0.1,
				},
				tertiary = {
					r = 0.7,
					g = 0.7,
					b = 0.1,
				},
			},
			allow_quality = false,
			result_is_always_fresh = true,
			allow_decomposition = false,
			allow_as_intermediate = false,
			always_show_made_in = true,
			auto_recycle = false,
		},
	})
end

-- == Recycling recipes ==--

data:extend({
	{
		type = "recipe",
		name = "rocs-rusting-iron-iron-gear-wheel-rusty-recycling",
		order = "a[smelting]-a[iron-plate]-rusty",
		enabled = true,
		subgroup = "other",
		category = "recycling",
		energy_required = 0.5 / 16,
		ingredients = {
			{
				type = "item",
				name = "rocs-rusting-iron-iron-gear-wheel-rusty",
				amount = 1,
			},
		},
		results = {
			{
				type = "item",
				name = "rocs-rusting-iron-iron-plate-rusty",
				amount = 0,
				extra_count_fraction = 0.5,
			},
		},
		hidden = true,
		allow_decomposition = false,
		unlock_results = false,
		localised_name = {
			"recipe-name.recycling",
			quality_mod_utils.get_item_localised_name("rocs-rusting-iron-iron-gear-wheel-rusty"),
		},
		icons = { -- Boilerplate from the quality mod:
			{
				icon = "__quality__/graphics/icons/recycling.png",
			},
			{
				icon = "__Rocs-Rusting-Iron__/graphics/icons/iron-gear-wheel-rusty.png",
				icon_size = 64,
				scale = (0.5 * defines.default_icon_size / 64) * 0.8,
			},
			{
				icon = "__quality__/graphics/icons/recycling-top.png",
			},
		},
		crafting_machine_tint = {
			primary = { 0.5, 0.5, 0.5, 0.5 },
			secondary = { 0.5, 0.5, 0.5, 0.5 },
			tertiary = { 0.5, 0.5, 0.5, 0.5 },
			quaternary = { 0.5, 0.5, 0.5, 0.5 },
		},
		show_amount_in_title = false,
		auto_recycle = false,
	},
	{
		type = "recipe",
		name = "rocs-rusting-iron-iron-stick-rusty-recycling",
		order = "a[smelting]-a[iron-plate]-rusty",
		enabled = true,
		subgroup = "other",
		category = "recycling",
		energy_required = 0.5 / 16,
		ingredients = {
			{
				type = "item",
				name = "rocs-rusting-iron-iron-stick-rusty",
				amount = 1,
			},
		},
		results = {
			{
				type = "item",
				name = "rocs-rusting-iron-iron-plate-rusty",
				amount = 0,
				extra_count_fraction = 0.125,
			},
		},
		hidden = true,
		allow_decomposition = false,
		unlock_results = false,
		localised_name = {
			"recipe-name.recycling",
			quality_mod_utils.get_item_localised_name("rocs-rusting-iron-iron-stick-rusty"),
		},
		icons = { -- Boilerplate from the quality mod:
			{
				icon = "__quality__/graphics/icons/recycling.png",
			},
			{
				icon = "__Rocs-Rusting-Iron__/graphics/icons/iron-stick-rusty.png",
				icon_size = 64,
				scale = (0.5 * defines.default_icon_size / 64) * 0.8,
			},
			{
				icon = "__quality__/graphics/icons/recycling-top.png",
			},
		},
		crafting_machine_tint = {
			primary = { 0.5, 0.5, 0.5, 0.5 },
			secondary = { 0.5, 0.5, 0.5, 0.5 },
			tertiary = { 0.5, 0.5, 0.5, 0.5 },
			quaternary = { 0.5, 0.5, 0.5, 0.5 },
		},
		show_amount_in_title = false,
		auto_recycle = false,
	},
})

if settings.startup["rocs-rusting-iron-engines-rust"].value then
	data:extend({
		{
			type = "recipe",
			name = AAI and "rocs-rusting-iron-motor-rusty-recycling" or "rocs-rusting-iron-engine-unit-rusty-recycling",
			order = "a[smelting]-a[iron-plate]-rusty",
			enabled = true,
			subgroup = "other",
			category = "recycling",
			energy_required = 5 / 16,
			ingredients = {
				{
					type = "item",
					name = AAI and "rocs-rusting-iron-motor-rusty" or "rocs-rusting-iron-engine-unit-rusty",
					amount = 1,
				},
			},
			results = AAI and {
				{
					type = "item",
					name = "rocs-rusting-iron-iron-gear-wheel-rusty",
					amount = 0,
					extra_count_fraction = 0.25,
				},
				{
					type = "item",
					name = "rocs-rusting-iron-iron-plate-rusty",
					amount = 0,
					extra_count_fraction = 0.25,
				},
			} or {
				{
					type = "item",
					name = "steel-plate",
					amount = 0,
					extra_count_fraction = 0.25,
				},
				{
					type = "item",
					name = "rocs-rusting-iron-iron-gear-wheel-rusty",
					amount = 0,
					extra_count_fraction = 0.25,
				},
				{
					type = "item",
					name = "pipe",
					amount = 0,
					extra_count_fraction = 0.5,
				},
			},
			hidden = true,
			allow_decomposition = false,
			unlock_results = false,
			localised_name = {
				"recipe-name.recycling",
				quality_mod_utils.get_item_localised_name(
					AAI and "rocs-rusting-iron-motor-rusty" or "rocs-rusting-iron-engine-unit-rusty"
				),
			},
			icons = { -- Boilerplate from the quality mod:
				{
					icon = "__quality__/graphics/icons/recycling.png",
				},
				{
					icon = "__Rocs-Rusting-Iron__/graphics/icons/engine-unit-rusty.png",
					icon_size = 64,
					scale = (0.5 * defines.default_icon_size / 64) * 0.8,
				},
				{
					icon = "__quality__/graphics/icons/recycling-top.png",
				},
			},
			crafting_machine_tint = {
				primary = { 0.5, 0.5, 0.5, 0.5 },
				secondary = { 0.5, 0.5, 0.5, 0.5 },
				tertiary = { 0.5, 0.5, 0.5, 0.5 },
				quaternary = { 0.5, 0.5, 0.5, 0.5 },
			},
			show_amount_in_title = false,
			auto_recycle = false,
		},
	})
end
