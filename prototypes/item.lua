local item_sounds = require("__base__.prototypes.item_sounds")
local item_tints = require("__base__.prototypes.item-tints")

local AAI = mods["aai-industry"]

data:extend({
	{
		type = "item",
		name = "rocs-rusting-iron-iron-plate-rusty",
		icon = "__Rocs-Rusting-Iron__/graphics/icons/iron-plate-rusty.png",
		icon_size = 64,
		subgroup = "raw-material",
		order = "a[smelting]-a[iron-plate]-rusty",
		inventory_move_sound = item_sounds.metal_small_inventory_move,
		pick_sound = item_sounds.metal_small_inventory_pickup,
		drop_sound = item_sounds.metal_small_inventory_move,
		stack_size = 100,
		random_tint_color = item_tints.iron_rust,
		spoil_level = 1,
	},
	{
		type = "item",
		name = "rocs-rusting-iron-iron-gear-wheel-rusty",
		icon = "__Rocs-Rusting-Iron__/graphics/icons/iron-gear-wheel-rusty.png",
		icon_size = 64,
		subgroup = "intermediate-product",
		order = "a[basic-intermediates]-a[iron-gear-wheel]-rusty",
		inventory_move_sound = item_sounds.metal_small_inventory_move,
		pick_sound = item_sounds.metal_small_inventory_pickup,
		drop_sound = item_sounds.metal_small_inventory_move,
		stack_size = 100,
		random_tint_color = item_tints.iron_rust,
		spoil_level = 1,
	},
	{
		type = "item",
		name = "rocs-rusting-iron-iron-stick-rusty",
		icon = "__Rocs-Rusting-Iron__/graphics/icons/iron-stick-rusty.png",
		icon_size = 64,
		subgroup = "intermediate-product",
		order = "a[basic-intermediates]-b[iron-stick]-rusty",
		inventory_move_sound = item_sounds.metal_small_inventory_move,
		pick_sound = item_sounds.metal_small_inventory_pickup,
		drop_sound = item_sounds.metal_small_inventory_move,
		stack_size = 100,
		random_tint_color = item_tints.iron_rust,
		spoil_level = 1,
	},
})

if settings.startup["rocs-rusting-iron-engines-rust"].value then
	data:extend({
		{
			type = "item",
			name = AAI and "rocs-rusting-iron-motor-rusty" or "rocs-rusting-iron-engine-unit-rusty",
			icon = "__Rocs-Rusting-Iron__/graphics/icons/engine-unit-rusty.png",
			icon_size = 64,
			subgroup = "intermediate-product",
			order = AAI and "g[engine-unit]-a[engine]-a[small]-rusty"
				or "c[advanced-intermediates]-a[engine-unit]-rusty",
			inventory_move_sound = AAI and item_sounds.mechanical_inventory_move
				or item_sounds.metal_large_inventory_move,
			pick_sound = AAI and item_sounds.mechanical_inventory_pickup or item_sounds.metal_large_inventory_pickup,
			drop_sound = AAI and item_sounds.mechanical_inventory_move or item_sounds.metal_large_inventory_move,
			stack_size = 50,
			random_tint_color = item_tints.iron_rust,
			spoil_level = 1,
		},
	})
end
