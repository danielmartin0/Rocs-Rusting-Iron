local item_tints = require("__base__.prototypes.item-tints")

local base_rusting_time = settings.startup["rocs-rusting-iron-time-minutes"].value * minute

-------------------------------------------------------------------------- Rusting items

for item_name,rust_metadata in pairs(RustingIron.rusting_items) do
  local rusty_item_name = item_name.."-rusty"

  local base_item = data.raw.item[item_name]
  base_item.spoil_ticks = rust_metadata.rust_timescale * base_rusting_time
  base_item.spoil_result = rusty_item_name

  data:extend({
    {
      type = "item",
      name = rusty_item_name,
      localised_name = {"item-name.rusty-item", base_item.localised_name or {"item-name."..item_name}},
      icon = rust_metadata.icon_root.."-rusty.png",
      icon_size = rust_metadata.icon_size or 64,
      subgroup = base_item.subgroup,
      order = base_item.order.."-rusty",
      inventory_move_sound = base_item.inventory_move_sound,
      pick_sound = base_item.pick_sound,
      drop_sound = base_item.drop_sound,
      stack_size = base_item.stack_size,
      random_tint_color = item_tints.iron_rust,
      spoil_level = 1,
      weight = base_item.weight or rust_metadata.weight or 1*kg
    }
  })
end

-------------------------------------------------------------------------- Technologies

-- If an item doesn't get an entry in the unlock_map table, then the base derusting recipe doesn't need research
local unlock_map = {}
for item_name,_ in pairs(RustingIron.rusting_items) do
  local recipe = data.raw.recipe[item_name]
  if recipe and recipe.enabled == false then
    unlock_map[item_name] = {}
  end
end

-- Derive unlock technologies for each rusting item that needs it
for _,technology in pairs(data.raw.technology) do
  for _,effect in pairs(technology.effects or {}) do
    if effect.type == "unlock-recipe" then
      local recipe_name = effect.recipe
      if unlock_map[recipe_name] then
        table.insert(unlock_map[recipe_name], technology.name)
      end
    end
  end
end

-- Add recipe unlocks to technologies
for derust_suffix,derust_metadata in pairs(RustingIron.derusting_recipes) do
  local derust_technology = derust_metadata.technology and data.raw.technology[derust_metadata.technology] or nil
  if derust_technology and derust_technology.effects == nil then
    derust_technology.effects = {}
  end
  for item_name,_ in pairs(RustingIron.rusting_items) do
    local derust_name = item_name.."-"..derust_suffix
    if derust_technology then
      table.insert(derust_technology.effects, {type="unlock-recipe", recipe=derust_name})
    elseif unlock_map[item_name] then
      for _,tech_name in pairs(unlock_map[item_name]) do
        table.insert(data.raw.technology[tech_name].effects, {type="unlock-recipe", recipe=derust_name})
      end
    end
  end
end

-------------------------------------------------------------------------- Derusting recipes

for item_name,rust_metadata in pairs(RustingIron.rusting_items) do
  local rusty_item_name = item_name.."-rusty"
  for derust_suffix,derust_metadata in pairs(RustingIron.derusting_recipes) do
    local derusting_recipe_name = item_name.."-"..derust_suffix
    local base_icon = {icon=rust_metadata.icon_root.."-derust.png", size=rust_metadata.icon_size or 64, draw_background=true}
    
    local amount = (rust_metadata.derust_amount or 1) * (derust_metadata.derust_amount or 1)
    local ingredients = util.table.deepcopy(derust_metadata.ingredients)
    if rust_metadata.derust_costscale then
      for _,ingredient in pairs(ingredients) do
        ingredient.amount = (rust_metadata.derust_costscale or 1) * ingredient.amount
      end
    end
    table.insert(ingredients, {type="item", name=rusty_item_name, amount=amount, ignored_by_stats=amount})
    local results = {{type="item", name=item_name, amount=amount, ignored_by_stats=amount, ignored_by_productivity=amount}}
    
    data:extend({
      {
        type = "recipe",
        name = derusting_recipe_name,
        localised_name = {derust_metadata.localised_name, {"item-name."..item_name}},
        icons = derust_metadata.overlay_icon and {
          base_icon,
          derust_metadata.overlay_icon
        } or {base_icon},
        category = derust_metadata.category,
        subgroup = "derusting",
        -- enabled if neither the derusting ingredients nor the item need to be researched
        enabled = (derust_metadata.technology == nil and unlock_map[item_name] == nil),
        result_is_always_fresh = true,
        always_show_made_in = true,
        allow_quality = false,
        allow_productivity = false,
        allow_decomposition = false,
        allow_as_intermediate = false,
        auto_recycle = false,
        energy_required = rust_metadata.derust_timescale * derust_metadata.derust_timescale,
        ingredients = ingredients,
        results = results,
        crafting_machine_tint = derust_metadata.crafting_machine_tint or nil
      }
    })
  end
end

-------------------------------------------------------------------------- Mercy mode

local mercy_mode = not settings.startup["rocs-rusting-iron-no-mercy"].value

if mercy_mode then
  for item_name,_ in pairs(RustingIron.rusting_items) do
    local base_recipe = data.raw.recipe[item_name]
    if base_recipe then
      base_recipe.result_is_always_fresh = true
    end
  end
end

-------------------------------------------------------------------------- Misc recipe changes

for recipe_name,recipe_metadata in pairs(RustingIron.recipes) do
  local recipe = data.raw.recipe[recipe_name]
  if recipe and recipe_metadata.rusty_results then
    for _,result in pairs(recipe.results) do
      if RustingIron.rusting_items[result.name] then
        result.name = result.name.."-rusty"
      end
    end
  end
end

-------------------------------------------------------------------------- Entity results

for _,entity in pairs(data.raw["simple-entity"]) do
  local entity_metadata = RustingIron.minable_entities[entity.name] or {}
  if not entity_metadata.ignore then
    if entity.minable and entity.minable.results then
      for _,result in pairs(entity.minable.results) do
        if RustingIron.rusting_items[result.name] then
          result.name = result.name.."-rusty"
        end
      end
    end
  end
end

-------------------------------------------------------------------------- Recycling

if mods["quality"] then
  for item_name,rust_metadata in pairs(RustingIron.rusting_items) do
    local base_recycling_recipe = data.raw.recipe[item_name.."-recycling"]
    if base_recycling_recipe then
      local results = util.table.deepcopy(base_recycling_recipe.results)
      for _,result in pairs(results) do
        local ingredient_metadata = RustingIron.rusting_items[result.name]
        if result.type == "item" and ingredient_metadata then
          result.name = result.name.."-rusty"
        end
      end

      local rusty_item_name = item_name.."-rusty"
      local rusty_item = data.raw.item[rusty_item_name]
      data:extend({
        {
          type = "recipe",
          name = rusty_item_name.."-recycling",
          localised_name = {"recipe-name.recycling", rusty_item.localised_name},
          icons = generate_recycling_recipe_icons_from_item(rusty_item),
          category = "recycling",
          hidden = true,
          allow_decomposition = false,
          unlock_results = false,
          show_amount_in_title = false,
          auto_recycle = false,
          energy_required = base_recycling_recipe.energy_required,
          ingredients = {{type="item", name=rusty_item_name, amount=1}},
          results = results,
          crafting_machine_tint = {
            primary = { 0.5, 0.5, 0.5, 0.5 },
            secondary = { 0.5, 0.5, 0.5, 0.5 },
            tertiary = { 0.5, 0.5, 0.5, 0.5 },
            quaternary = { 0.5, 0.5, 0.5, 0.5 },
          }
        }
      })
    end
  end
end
