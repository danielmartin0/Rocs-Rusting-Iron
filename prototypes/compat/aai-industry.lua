if mods["aai-industry"] then
  RustingIron.rusting_items["engine-unit"] = nil
  RustingIron.rusting_items["motor"] = {
    rust_timescale = RustingIron.RUSTING_SLOW,
    derust_timescale = RustingIron.DERUST_MEDIUM,
    derust_cost = 3,
    icon_root = "__Rocs-Rusting-Iron__/graphics/icons/engine-unit"
  }
  RustingIron.derusting_recipes["derusting"].ingredients = {{type="item", name="sand", amount=1}}
end
