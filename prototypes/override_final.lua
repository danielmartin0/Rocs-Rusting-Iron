local AAI = mods["aai-industry"]

--== Game adjustments ==--

for _, result in pairs(data.raw.recipe["scrap-recycling"].results) do
	if result.name == "iron-gear-wheel" then
		result.name = "rocs-rusting-iron-iron-gear-wheel-rusty"
	end

	if result.name == "iron-stick" then
		result.name = "rocs-rusting-iron-iron-stick-rusty"
	end

	if result.name == "iron-plate" then
		result.name = "rocs-rusting-iron-iron-plate-rusty"
	end

	if result.name == "engine-unit" then
		result.name = "rocs-rusting-iron-engine-unit-rusty"
	end
end

for name, entity in pairs(data.raw["simple-entity"]) do
	if string.sub(name, 1, 14) == "fulgoran-ruin-" then
		if entity.minable and entity.minable.results then
			for _, result in pairs(entity.minable.results) do
				if result.name == "iron-gear-wheel" then
					result.name = "rocs-rusting-iron-iron-gear-wheel-rusty"
				end

				if result.name == "iron-stick" then
					result.name = "rocs-rusting-iron-iron-stick-rusty"
				end

				if result.name == "iron-plate" then
					result.name = "rocs-rusting-iron-iron-plate-rusty"
				end

				if result.name == "engine-unit" then
					result.name = "rocs-rusting-iron-engine-unit-rusty"
				end
			end
		end
	end
end

--== Ensure item weights match the non-rusted versions ==--

-- This approach is broken because the weights are set after prototype definitions.

-- data.raw.item["rocs-rusting-iron-iron-plate-rusty"].weight = data.raw.item["iron-plate"].weight
-- data.raw.item["rocs-rusting-iron-iron-gear-wheel-rusty"].weight = data.raw.item["iron-gear-wheel"].weight
-- data.raw.item["rocs-rusting-iron-iron-stick-rusty"].weight = data.raw.item["iron-stick"].weight

-- if settings.startup["rocs-rusting-iron-engines-rust"].value then
-- 	if AAI then
-- 		data.raw.item["rocs-rusting-iron-motor-rusty"].weight = data.raw.item["motor"].weight
-- 	else
-- 		data.raw.item["rocs-rusting-iron-engine-unit-rusty"].weight = data.raw.item["engine-unit"].weight
-- 	end
-- end

data.raw.item["rocs-rusting-iron-iron-plate-rusty"].weight = 1000
data.raw.item["rocs-rusting-iron-iron-gear-wheel-rusty"].weight = 1000
data.raw.item["rocs-rusting-iron-iron-stick-rusty"].weight = 500
if settings.startup["rocs-rusting-iron-engines-rust"].value then
	if AAI then
		data.raw.item["rocs-rusting-iron-motor-rusty"].weight = 1250
	else
		data.raw.item["rocs-rusting-iron-engine-unit-rusty"].weight = 2500
	end
end

--== Redundant changes (in case of conflicts with other mods) ==--

if AAI then
	local motor_derust_recipe_exists = false
	local iron_stick_derust_recipe_exists = false

	for _, effect in pairs(data.raw.technology["burner-mechanics"].effects) do
		if effect.type == "unlock-recipe" and effect.recipe == "rocs-rusting-iron-iron-stick-derusting" then
			iron_stick_derust_recipe_exists = true
		end

		if effect.type == "unlock-recipe" and effect.recipe == "rocs-rusting-iron-motor-derusting" then
			motor_derust_recipe_exists = true
		end
	end

	if settings.startup["rocs-rusting-iron-engines-rust"].value and not motor_derust_recipe_exists then
		table.insert(data.raw.technology["burner-mechanics"].effects, {
			type = "unlock-recipe",
			recipe = "rocs-rusting-iron-motor-derusting",
		})
	end

	if not iron_stick_derust_recipe_exists then
		table.insert(data.raw.technology["burner-mechanics"].effects, {
			type = "unlock-recipe",
			recipe = "rocs-rusting-iron-iron-stick-derusting",
		})
	end
else
	local tech_names_with_stick = {
		"railway",
		"concrete",
		"circuit-network",
		"electric-energy-distribution-1",
	}

	for _, tech_name in pairs(tech_names_with_stick) do
		local tech = data.raw.technology[tech_name]
		local machine_derust_recipe_exists = false

		for _, effect in pairs(tech.effects) do
			if effect.type == "unlock-recipe" and effect.recipe == "rocs-rusting-iron-iron-stick-derusting" then
				machine_derust_recipe_exists = true
				break
			end
		end

		if not machine_derust_recipe_exists then
			table.insert(tech.effects, {
				type = "unlock-recipe",
				recipe = "rocs-rusting-iron-iron-stick-derusting",
			})
		end
	end

	if settings.startup["rocs-rusting-iron-engines-rust"].value then
		local engine_derust_recipe_exists = false
		for _, effect in pairs(data.raw.technology["engine"].effects) do
			if effect.type == "unlock-recipe" and effect.recipe == "rocs-rusting-iron-engine-unit-derusting" then
				engine_derust_recipe_exists = true
				break
			end
		end

		if not engine_derust_recipe_exists then
			table.insert(data.raw.technology["engine"].effects, {
				type = "unlock-recipe",
				recipe = "rocs-rusting-iron-engine-unit-derusting",
			})
		end
	end
end

--== Debug: Unhide all recipes that end in '-recycling' ==--
-- for _, recipe in pairs(data.raw.recipe) do
-- 	if string.sub(recipe.name, -10) == "-recycling" then
-- 		recipe.hidden = false
-- 	end
-- end
