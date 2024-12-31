
--------------------------------------------------------------------------------
-- Add enemies from other planets
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- MARK: Add Vulcanus enemies aka demolishers
--------------------------------------------------------------------------------

data.raw.planet["nauvis"].map_gen_settings.territory_settings = data.raw.planet["vulcanus"].map_gen_settings.territory_settings

-- Add demolishers - TODO: Add setting for enabling demolishers
data.raw["noise-expression"]["demolisher_starting_area"].expression = "if(vulcano_coverage > 0.2, 0, 1)"
