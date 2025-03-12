if mods["aai-industry"] then
  ScrapIndustry.items["engine-unit"] = nil
  RustingIron.items["motor"] = {
    rust_scalar = RustingIron.RUSTING_SLOW,
    derust_time = RustingIron.DERUST_MEDIUM,
    icon_root = "__Rocs-Rusting-Iron__/graphics/icons/engine-unit"
  }
end
