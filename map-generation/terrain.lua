--------------------------------------------------------------------------------
-- Fixes map generation for terrain
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- MARK: Fix Nauvis related map gen settings
--------------------------------------------------------------------------------

-- Remove water where at vulcano spots
data.raw.tile["water"].autoplace = {
  probability_expression = "if(vulcano_coverage, -inf, water_base(0, 100))"
}
data.raw.tile["deepwater"].autoplace = {
  probability_expression = "if(vulcano_coverage, -inf, water_base(-2, 200))"
}

-- Remove nauvis trees from vulcanus_terrain. TODO: also removes big patches of trees on map, but i would like to keep the forests
data.raw["noise-expression"]["trees_forest_path_cutout"].expression = "min(nauvis_bridge_paths, nauvis_hills_paths, forest_paths, if(vulcanus_terrain, -inf, 0))"
data.raw["noise-expression"]["trees_forest_path_cutout_faded"].expression = "trees_forest_path_cutout * 0.3 + tree_small_noise * 0.1 + if(vulcanus_terrain, -inf, 0)"

-- Remove nauvis cliffs from vulcanus_terrain
data.raw["noise-expression"]["cliffiness_nauvis"].expression = "(main_cliffiness >= cliff_cutoff) * 10 + if(vulcanus_terrain, -inf, 0)"

--------------------------------------------------------------------------------
-- MARK: Fix Vulcanus related map gen settings
--------------------------------------------------------------------------------

-- START: Update map gen settings
-- autoplace_controls
data.raw.planet["nauvis"].map_gen_settings.autoplace_controls["vulcanus_volcanism"] = {}

-- tile settings
data.raw.planet["nauvis"].map_gen_settings.autoplace_settings.tile.settings["volcanic-folds"] = {}
data.raw.planet["nauvis"].map_gen_settings.autoplace_settings.tile.settings["volcanic-folds-flat"] = {}
data.raw.planet["nauvis"].map_gen_settings.autoplace_settings.tile.settings["lava"] = {}
data.raw.planet["nauvis"].map_gen_settings.autoplace_settings.tile.settings["lava-hot"] = {}
-- END: Update map gen settings

-- Fix probability expressions for tiles
data.raw.tile["volcanic-folds"].autoplace.probability_expression = "updated_volcanic_folds" -- Removes all lava spots except vulkane
data.raw.tile["volcanic-folds-flat"].autoplace.probability_expression = "updated_volcanic_folds_flat" -- Adds big ring around vulcano
data.raw.tile["lava"].autoplace.probability_expression = "lava_mountains_range"
data.raw.tile["lava-hot"].autoplace.probability_expression = "lava_hot_mountains_range"

-- Fix autoplace controls
data.raw["autoplace-control"]["vulcanus_coal"] = nil
data.raw["autoplace-control"]["vulcanus_volcanism"].can_be_disabled = true
data.raw["autoplace-control"]["vulcanus_volcanism"].order = nil
data.raw["autoplace-control"]["vulcanus_volcanism"].category = "resource"

-- START: Update noise expressions
-- Increase radius for vulcane to start spawning
data.raw["noise-expression"]["vulcanus_starting_area_radius"].expression = "0.7 * 0.75" -- "0.7 * 0.75"
-- Influences volcanic-folds-flat tile - distance and radius are increased to match mountain_volcano_spots, also removes remains of starter spot
data.raw["noise-expression"]["vulcanus_ashlands_start"].expression = "4 * starting_spot_at_angle{ angle = vulcanus_ashlands_angle,\z
                                                                                                  distance = 170 * vulcanus_starting_area_radius,\z
                                                                                                  radius = 740 * vulcanus_starting_area_radius,\z
                                                                                                  x_distortion = 0.1 * vulcanus_starting_area_radius * (vulcanus_wobble_x + vulcanus_wobble_large_x + vulcanus_wobble_huge_x),\z
                                                                                                  y_distortion = 0.1 * vulcanus_starting_area_radius * (vulcanus_wobble_y + vulcanus_wobble_large_y + vulcanus_wobble_huge_y)}"
-- Influences volcanic-folds-flat tile - distance and radius are increased to match mountain_volcano_spots, also removes remains of starter spot
data.raw["noise-expression"]["vulcanus_basalts_start"].expression = "2 * starting_spot_at_angle{ angle = vulcanus_basalts_angle,\z
                                                                                                 distance = 180 * vulcanus_starting_area_radius,\z
                                                                                                 radius = 760 * vulcanus_starting_area_radius,\z
                                                                                                 x_distortion = 0.1 * vulcanus_starting_area_radius * (vulcanus_wobble_x + vulcanus_wobble_large_x + vulcanus_wobble_huge_x),\z
                                                                                                 y_distortion = 0.1 * vulcanus_starting_area_radius * (vulcanus_wobble_y + vulcanus_wobble_large_y + vulcanus_wobble_huge_y)}"
-- Influences volcanic-folds-flat tile - distance and radius are increased to match mountain_volcano_spots, also removes remains of starter spot
data.raw["noise-expression"]["vulcanus_mountains_start"].expression = "2 * starting_spot_at_angle{ angle = vulcanus_mountains_angle,\z
                                                                                                   distance = 190 * vulcanus_starting_area_radius,\z
                                                                                                   radius = 780 * vulcanus_starting_area_radius,\z
                                                                                                   x_distortion = 0.05 * vulcanus_starting_area_radius * (vulcanus_wobble_x + vulcanus_wobble_large_x + vulcanus_wobble_huge_x),\z
                                                                                                   y_distortion = 0.05 * vulcanus_starting_area_radius * (vulcanus_wobble_y + vulcanus_wobble_large_y + vulcanus_wobble_huge_y)}"
-- Removes starter spot from vulcanus
data.raw["noise-expression"]["mountain_volcano_spots"].expression = "raw_spots - starting_protector"
-- Make volcano spots much rarer, see region_size -- TODO: Use this property as frecuency slider in map generator
data.raw["noise-expression"]["mountain_volcano_spots"].local_expressions.raw_spots = "spot_noise{x = x + vulcanus_wobble_x/2 + vulcanus_wobble_large_x/12 + vulcanus_wobble_huge_x/80,\z
                                                                                                 y = y + vulcanus_wobble_y/2 + vulcanus_wobble_large_y/12 + vulcanus_wobble_huge_y/80,\z
                                                                                                 seed0 = map_seed,\z
                                                                                                 seed1 = 1,\z
                                                                                                 candidate_spot_count = 1,\z
                                                                                                 suggested_minimum_candidate_point_spacing = volcano_spot_spacing,\z
                                                                                                 skip_span = 1,\z
                                                                                                 skip_offset = 0,\z
                                                                                                 region_size = 256*5,\z
                                                                                                 density_expression = volcano_area / volcanism_sq,\z
                                                                                                 spot_quantity_expression = volcano_spot_radius * volcano_spot_radius,\z
                                                                                                 spot_radius_expression = volcano_spot_radius,\z
                                                                                                 hard_region_target_quantity = 0,\z
                                                                                                 spot_favorability_expression = volcano_area,\z
                                                                                                 basement_value = 0,\z
                                                                                                 maximum_spot_basement_radius = volcano_spot_radius}"
-- Make volcano spots much rarer, see region_size  -- TODO: Use this property as size slider in map generator
data.raw["noise-expression"]["mountain_volcano_spots"].local_expressions.volcano_spot_radius = "2 * 200 * volcanism"
-- Removes all lava spots except vulkane
data.raw["noise-expression"]["lava_mountains_range"].expression = "1100 * range_select_base(mountain_lava_spots, 0.3, 1, 1, 0, 1) - offset_vulcano"
-- Removes all lava spots except vulkane
data.raw["noise-expression"]["lava_hot_mountains_range"].expression = "1000 * range_select_base(mountain_lava_spots, 0.15, 0.35, 1, 0, 1) - offset_vulcano"

-- New noise expressions
data:extend
{
  {
    type = "noise-expression",
    name = "offset_vulcano",
    expression = "1"  -- To remove the small random lava puddles
  },
  {
    -- Noise expression for ring around lava spots
    type = "noise-expression",
    name = "updated_volcanic_folds",
    expression = "10 * range_select_base(mountain_volcano_spots * 1.95 - 0.9, 0.16, 1, 1, 0, 1) - offset_vulcano"  --  Creates ring around lava_hot_mountains_range
  },
  {
    -- Noise expression for surroundings of updated_volcanic_folds
    type = "noise-expression",
    name = "updated_volcanic_folds_flat",
    expression = "10 * range_select_base(mountain_volcano_spots * 1.95 - 0.9, 0, 0.5, 1, 0, 1) - offset_vulcano"  --  Creates ring around updated_volcanic_folds
  },
  {
    -- Noise expression for vulcano spot and close surround as mask
    type = "noise-expression",
    name = "vulcano_coverage",
    expression = "if(max(updated_volcanic_folds, lava_mountains_range, lava_hot_mountains_range) > 0, 1, 0)"
  },
  {
    -- Noise expression for all vulcanus terrain as mask
    type = "noise-expression",
    name = "vulcanus_terrain",
    expression = "if(max(vulcano_coverage, updated_volcanic_folds_flat) > 0, 1, 0)"
  },
}
-- END: Update noise expressions
