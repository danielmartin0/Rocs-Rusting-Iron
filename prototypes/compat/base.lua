RustingIron.items["iron-plate"] = {
  rust_scalar = RustingIron.RUSTING_NORMAL,
  derust_time = RustingIron.DERUST_EASY,
  icon_root = "__Rocs-Rusting-Iron__/graphics/icons/iron-plate",
}
RustingIron.items["iron-gear-wheel"] = {
  rust_scalar = RustingIron.RUSTING_NORMAL,
  derust_time = RustingIron.DERUST_EASY,
  icon_root = "__Rocs-Rusting-Iron__/graphics/icons/iron-gear-wheel",
}
RustingIron.items["iron-stick"] = {
  rust_scalar = RustingIron.RUSTING_NORMAL,
  derust_time = RustingIron.DERUST_EASY,
  icon_root = "__Rocs-Rusting-Iron__/graphics/icons/iron-stick",
}

if settings.startup["rocs-rusting-iron-engines-rust"].value then
  RustingIron.items["engine-unit"] = {
    rust_scalar = RustingIron.RUSTING_SLOW,
    derust_time = RustingIron.DERUST_COMPLEX,
    derust_cost = 3,
    icon_root = "__Rocs-Rusting-Iron__/graphics/icons/engine-unit"
  }
end

RustingIron.recipes["derusting"] = {
  ingredients = {{type="item", name="stone", amount=1}},
  category = "crafting",
  derust_amount = 1,
  time_scalar = 1,
  overlay_icon = nil,
}
RustingIron.recipes["chemical-derusting"] = {
  ingredients = {
    {type="fluid", name="sulfuric-acid", amount=10},
    {type="fluid", name="water", amount=30}
  },
  category = "chemistry",
  derust_amount = 2,
  time_scalar = 1,
  overlay_icon = "__base__/graphics/icons/fluid/sulfuric-acid.png"
}
