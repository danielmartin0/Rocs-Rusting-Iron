local AAI = mods["aai-industry"]

-- == Spoil settings ==--

data.raw.item["iron-plate"].spoil_ticks = 60 * 60 * settings.startup["rocs-rusting-iron-time-minutes"].value
data.raw.item["iron-plate"].spoil_result = "rocs-rusting-iron-iron-plate-rusty"
data.raw.item["iron-gear-wheel"].spoil_ticks = 60 * 60 * settings.startup["rocs-rusting-iron-time-minutes"].value
data.raw.item["iron-gear-wheel"].spoil_result = "rocs-rusting-iron-iron-gear-wheel-rusty"
data.raw.item["iron-stick"].spoil_ticks = 60 * 60 * settings.startup["rocs-rusting-iron-time-minutes"].value
data.raw.item["iron-stick"].spoil_result = "rocs-rusting-iron-iron-stick-rusty"

if settings.startup["rocs-rusting-iron-engines-rust"].value then
	data.raw.item[AAI and "motor" or "engine-unit"].spoil_ticks = 60
		* 60
		* settings.startup["rocs-rusting-iron-time-minutes"].value

	data.raw.item[AAI and "motor" or "engine-unit"].spoil_result = AAI and "rocs-rusting-iron-motor-rusty"
		or "rocs-rusting-iron-engine-unit-rusty"
end

data.raw.recipe["iron-gear-wheel"].result_is_always_fresh = true
data.raw.recipe["iron-stick"].result_is_always_fresh = true
data.raw.recipe["iron-plate"].result_is_always_fresh = true

if settings.startup["rocs-rusting-iron-engines-rust"].value then
	if not AAI then
		data.raw.recipe["engine-unit"].result_is_always_fresh = true
	else
		data.raw.recipe["motor"].result_is_always_fresh = true
	end
end

-- == Recipe unlocks ==--

for _, technology in pairs(data.raw.technology) do
	if technology.effects then
		for _, effect in pairs(technology.effects) do
			if effect.type == "unlock-recipe" then
				if effect.recipe == "iron-stick" then
					table.insert(technology.effects, {
						type = "unlock-recipe",
						recipe = "rocs-rusting-iron-iron-stick-derusting",
					})
					table.insert(technology.effects, {
						type = "unlock-recipe",
						recipe = "rocs-rusting-iron-iron-stick-chemical-derusting",
					})
				end

				if settings.startup["rocs-rusting-iron-engines-rust"].value then
					if (not AAI and effect.recipe == "engine-unit") or (AAI and effect.recipe == "motor") then
						table.insert(technology.effects, {
							type = "unlock-recipe",
							recipe = AAI and "rocs-rusting-iron-motor-derusting"
								or "rocs-rusting-iron-engine-unit-derusting",
						})
						table.insert(technology.effects, {
							type = "unlock-recipe",
							recipe = AAI and "rocs-rusting-iron-motor-chemical-derusting"
								or "rocs-rusting-iron-engine-unit-chemical-derusting",
						})
					end
				end
			end
		end
	end
end
