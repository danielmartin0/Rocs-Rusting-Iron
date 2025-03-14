RustingIron.rusting_items["iron-plate"] = {
  rust_timescale = RustingIron.RUSTING_NORMAL,
  derust_timescale = RustingIron.DERUST_EASY,
  derust_amount = 1,
  icon_root = "__Rocs-Rusting-Iron__/graphics/icons/iron-plate",
}
RustingIron.rusting_items["iron-gear-wheel"] = {
  rust_timescale = RustingIron.RUSTING_NORMAL,
  derust_timescale = RustingIron.DERUST_EASY,
  derust_amount = 1,
  icon_root = "__Rocs-Rusting-Iron__/graphics/icons/iron-gear-wheel",
}
RustingIron.rusting_items["iron-stick"] = {
  rust_timescale = RustingIron.RUSTING_NORMAL,
  derust_timescale = RustingIron.DERUST_EASY,
  derust_amount = 2,
  icon_root = "__Rocs-Rusting-Iron__/graphics/icons/iron-stick",
}

if settings.startup["rocs-rusting-iron-engines-rust"].value then
  RustingIron.rusting_items["engine-unit"] = {
    rust_timescale = RustingIron.RUSTING_SLOW,
    derust_timescale = RustingIron.DERUST_COMPLEX,
    derust_amount = 1,
    derust_costscale = 3,
    icon_root = "__Rocs-Rusting-Iron__/graphics/icons/engine-unit"
  }
end

RustingIron.derusting_recipes["derusting"] = {
  ingredients = {{type="item", name="stone", amount=1}},
  localised_name = "recipe-name.item-derusting",
  category = "crafting",
  derust_amount = 1,
  derust_timescale = 1
}
RustingIron.derusting_recipes["chemical-derusting"] = {
  ingredients = {
    {type="fluid", name="sulfuric-acid", amount=10},
    {type="fluid", name="water", amount=30}
  },
  localised_name = "recipe-name.chemical-derusting",
  category = "chemistry",
  technology = "sulfur-processing",
  derust_amount = 2,
  derust_timescale = 1,
  overlay_icon = {icon="__base__/graphics/icons/fluid/sulfuric-acid.png", shift={-8, -8}, scale=0.35, draw_background=true},
  crafting_machine_tint = {
    primary = {r=0.7, g=0.7, b=0.1},
    secondary = {r=0.8, g=0.8, b=0.1},
    tertiary = {r=0.7, g=0.7, b=0.1},
  }
}
