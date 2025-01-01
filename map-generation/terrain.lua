--------------------------------------------------------------------------------
-- Fixes map generation for terrain
--------------------------------------------------------------------------------
-- require("map-generation.decorative-noise-expressions")

local function mask_vulcano_coverage(decorative, decorative_type)
  data.raw[decorative_type][decorative].autoplace.probability_expression = "mask_vulcano_coverage(" .. string.gsub(decorative, '-', '_') .. ")"
end

local function mask_vulcano_terrain(decorative, decorative_type)
  data.raw[decorative_type][decorative].autoplace.probability_expression = "mask_vulcano_terrain(" .. string.gsub(decorative, '-', '_') .. ")"
end

local function mask_off_vulcano_coverage(decorative, decorative_type)
  data.raw[decorative_type][decorative].autoplace.probability_expression = "mask_off_vulcano_coverage(" .. string.gsub(decorative, '-', '_') .. ")"
end

local function mask_off_vulcano_terrain(decorative, decorative_type)
  data.raw[decorative_type][decorative].autoplace.probability_expression = "mask_off_vulcano_terrain(" .. string.gsub(decorative, '-', '_') .. ")"
end

data:extend
({
  {
    -- Define starting radius
    type = "noise-expression",
    name = "new_starting_radius",
    expression = "0.7 * 0.75"
  }
})

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
data.raw["noise-expression"]["trees_forest_path_cutout"].expression = "mask_off_vulcano_terrain(min(nauvis_bridge_paths, nauvis_hills_paths, forest_paths))"
data.raw["noise-expression"]["trees_forest_path_cutout_faded"].expression = "mask_off_vulcano_terrain(trees_forest_path_cutout * 0.3 + tree_small_noise * 0.1)"

-- Remove nauvis decoratives from vulcano_coverage
mask_off_vulcano_coverage("cracked-mud-decal", "optimized-decorative")
mask_off_vulcano_coverage("dark-mud-decal", "optimized-decorative")
mask_off_vulcano_coverage("lichen-decal", "optimized-decorative")
mask_off_vulcano_coverage("light-mud-decal", "optimized-decorative")
mask_off_vulcano_coverage("small-rock", "optimized-decorative")
mask_off_vulcano_coverage("small-sand-rock", "optimized-decorative")
mask_off_vulcano_coverage("tiny-rock", "optimized-decorative")

-- Remove nauvis decoratives from vulcanus_terrain
mask_off_vulcano_terrain("big-rock", "simple-entity")
mask_off_vulcano_terrain("big-sand-rock", "simple-entity")
mask_off_vulcano_terrain("brown-asterisk", "optimized-decorative")
mask_off_vulcano_terrain("brown-asterisk-mini", "optimized-decorative")
mask_off_vulcano_terrain("brown-carpet-grass", "optimized-decorative")
mask_off_vulcano_terrain("brown-fluff", "optimized-decorative")
mask_off_vulcano_terrain("brown-fluff-dry", "optimized-decorative")
mask_off_vulcano_terrain("brown-hairy-grass", "optimized-decorative")
mask_off_vulcano_terrain("garballo", "optimized-decorative")
mask_off_vulcano_terrain("garballo-mini-dry", "optimized-decorative")
mask_off_vulcano_terrain("green-asterisk", "optimized-decorative")
mask_off_vulcano_terrain("green-asterisk-mini", "optimized-decorative")
mask_off_vulcano_terrain("green-bush-mini", "optimized-decorative")
mask_off_vulcano_terrain("green-carpet-grass", "optimized-decorative")
mask_off_vulcano_terrain("green-croton", "optimized-decorative")
mask_off_vulcano_terrain("green-desert-bush", "optimized-decorative")
mask_off_vulcano_terrain("green-hairy-grass", "optimized-decorative")
mask_off_vulcano_terrain("green-pita", "optimized-decorative")
mask_off_vulcano_terrain("green-pita-mini", "optimized-decorative")
mask_off_vulcano_terrain("green-small-grass", "optimized-decorative")
mask_off_vulcano_terrain("huge-rock", "simple-entity")
mask_off_vulcano_terrain("medium-rock", "optimized-decorative")
mask_off_vulcano_terrain("medium-sand-rock", "optimized-decorative")
mask_off_vulcano_terrain("red-asterisk", "optimized-decorative")
mask_off_vulcano_terrain("red-croton", "optimized-decorative")
mask_off_vulcano_terrain("red-desert-bush", "optimized-decorative")
mask_off_vulcano_terrain("red-desert-decal", "optimized-decorative")
mask_off_vulcano_terrain("red-pita", "optimized-decorative")
mask_off_vulcano_terrain("sand-decal", "optimized-decorative")
mask_off_vulcano_terrain("sand-dune-decal", "optimized-decorative")
mask_off_vulcano_terrain("white-desert-bush", "optimized-decorative")

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

-- decorative settings
data.raw.planet["nauvis"].map_gen_settings.autoplace_settings.decorative.settings["vulcanus-rock-decal-large"] = {}
data.raw.planet["nauvis"].map_gen_settings.autoplace_settings.decorative.settings["vulcanus-crack-decal"] = {}
data.raw.planet["nauvis"].map_gen_settings.autoplace_settings.decorative.settings["vulcanus-crack-decal-large"] = {}
data.raw.planet["nauvis"].map_gen_settings.autoplace_settings.decorative.settings["vulcanus-crack-decal-huge-warm"] = {}
data.raw.planet["nauvis"].map_gen_settings.autoplace_settings.decorative.settings["vulcanus-crack-decal-warm"] = {}
data.raw.planet["nauvis"].map_gen_settings.autoplace_settings.decorative.settings["calcite-stain"] = {}
data.raw.planet["nauvis"].map_gen_settings.autoplace_settings.decorative.settings["calcite-stain-small"] = {}
data.raw.planet["nauvis"].map_gen_settings.autoplace_settings.decorative.settings["sulfur-stain"] = {}
data.raw.planet["nauvis"].map_gen_settings.autoplace_settings.decorative.settings["sulfur-stain-small"] = {}
data.raw.planet["nauvis"].map_gen_settings.autoplace_settings.decorative.settings["sulfuric-acid-puddle"] = {}
data.raw.planet["nauvis"].map_gen_settings.autoplace_settings.decorative.settings["sulfuric-acid-puddle-small"] = {}
data.raw.planet["nauvis"].map_gen_settings.autoplace_settings.decorative.settings["crater-small"] = {}
data.raw.planet["nauvis"].map_gen_settings.autoplace_settings.decorative.settings["crater-large"] = {}
data.raw.planet["nauvis"].map_gen_settings.autoplace_settings.decorative.settings["pumice-relief-decal"] = {}
data.raw.planet["nauvis"].map_gen_settings.autoplace_settings.decorative.settings["vulcanus-sand-decal"] = {}
data.raw.planet["nauvis"].map_gen_settings.autoplace_settings.decorative.settings["vulcanus-dune-decal"] = {}
data.raw.planet["nauvis"].map_gen_settings.autoplace_settings.decorative.settings["waves-decal"] = {}
data.raw.planet["nauvis"].map_gen_settings.autoplace_settings.decorative.settings["medium-volcanic-rock"] = {}
data.raw.planet["nauvis"].map_gen_settings.autoplace_settings.decorative.settings["small-volcanic-rock"] = {}
data.raw.planet["nauvis"].map_gen_settings.autoplace_settings.decorative.settings["tiny-volcanic-rock"] = {}
data.raw.planet["nauvis"].map_gen_settings.autoplace_settings.decorative.settings["tiny-rock-cluster"] = {}
data.raw.planet["nauvis"].map_gen_settings.autoplace_settings.decorative.settings["small-sulfur-rock"] = {}
data.raw.planet["nauvis"].map_gen_settings.autoplace_settings.decorative.settings["tiny-sulfur-rock"] = {}
data.raw.planet["nauvis"].map_gen_settings.autoplace_settings.decorative.settings["sulfur-rock-cluster"] = {}
data.raw.planet["nauvis"].map_gen_settings.autoplace_settings.decorative.settings["vulcanus-lava-fire"] = {}

-- entity settings
data.raw.planet["nauvis"].map_gen_settings.autoplace_settings.entity.settings["crater-cliff"] = {}
data.raw.planet["nauvis"].map_gen_settings.autoplace_settings.entity.settings["vulcanus-chimney"] = {}
data.raw.planet["nauvis"].map_gen_settings.autoplace_settings.entity.settings["vulcanus-chimney-faded"] = {}
data.raw.planet["nauvis"].map_gen_settings.autoplace_settings.entity.settings["vulcanus-chimney-cold"] = {}
data.raw.planet["nauvis"].map_gen_settings.autoplace_settings.entity.settings["vulcanus-chimney-short"] = {}
data.raw.planet["nauvis"].map_gen_settings.autoplace_settings.entity.settings["vulcanus-chimney-truncated"] = {}
data.raw.planet["nauvis"].map_gen_settings.autoplace_settings.entity.settings["huge-volcanic-rock"] = {}
data.raw.planet["nauvis"].map_gen_settings.autoplace_settings.entity.settings["big-volcanic-rock"] = {}
-- END: Update map gen settings

-- Fix probability expressions for tiles
data.raw.tile["volcanic-folds"].autoplace.probability_expression = "updated_volcanic_folds" -- Removes all lava spots except vulkane
data.raw.tile["volcanic-folds-flat"].autoplace.probability_expression = "updated_volcanic_folds_flat" -- Adds big ring around vulcano
data.raw.tile["lava"].autoplace.probability_expression = "lava_mountains_range"
data.raw.tile["lava-hot"].autoplace.probability_expression = "lava_hot_mountains_range"

-- Fix autoplace controls
data.raw["autoplace-control"]["vulcanus_volcanism"].can_be_disabled = true
data.raw["autoplace-control"]["vulcanus_volcanism"].order = nil
data.raw["autoplace-control"]["vulcanus_volcanism"].category = "resource"

-- START: Update noise expressions
-- Increase radius for vulcane to start spawning
data.raw["noise-expression"]["vulcanus_starting_area_radius"].expression = "new_starting_radius"
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
data.raw["noise-expression"]["mountain_volcano_spots"].local_expressions.density_multiplier = "5 / sqrt(control:vulcanus_volcanism:frequency)"
data.raw["noise-expression"]["mountain_volcano_spots"].local_expressions.raw_spots = "spot_noise{x = x + vulcanus_wobble_x/2 + vulcanus_wobble_large_x/12 + vulcanus_wobble_huge_x/80,\z
                                                                                                 y = y + vulcanus_wobble_y/2 + vulcanus_wobble_large_y/12 + vulcanus_wobble_huge_y/80,\z
                                                                                                 seed0 = map_seed,\z
                                                                                                 seed1 = 1,\z
                                                                                                 candidate_spot_count = 1,\z
                                                                                                 suggested_minimum_candidate_point_spacing = volcano_spot_spacing,\z
                                                                                                 skip_span = 1,\z
                                                                                                 skip_offset = 0,\z
                                                                                                 region_size = 256*density_multiplier,\z
                                                                                                 density_expression = volcano_area / volcanism_sq,\z
                                                                                                 spot_quantity_expression = volcano_spot_radius * volcano_spot_radius,\z
                                                                                                 spot_radius_expression = volcano_spot_radius,\z
                                                                                                 hard_region_target_quantity = 0,\z
                                                                                                 spot_favorability_expression = volcano_area,\z
                                                                                                 basement_value = 0,\z
                                                                                                 maximum_spot_basement_radius = volcano_spot_radius}"
-- Make volcano spots much rarer, see region_size
data.raw["noise-expression"]["mountain_volcano_spots"].local_expressions.volcano_spot_radius = "300 * volcanism * sqrt(control:vulcanus_volcanism:size + 1)"
-- Removes all lava spots except vulkane
data.raw["noise-expression"]["lava_mountains_range"].expression = "1100 * range_select_base(mountain_lava_spots, 0.3, 1, 1, 0, 1) - offset_vulcano"
-- Removes all lava spots except vulkane
data.raw["noise-expression"]["lava_hot_mountains_range"].expression = "1000 * range_select_base(mountain_lava_spots, 0.15, 0.35, 1, 0, 1) - offset_vulcano"

-- Mask vulcanus decoratives
data.raw["noise-expression"]["crater_cliff"].expression = "mask_vulcano_coverage(0.5 * (vulcanus_rock_noise + 0.5 * aux - 0.5 * moisture) * (1 - max(vulcanus_basalts_biome,vulcanus_ashlands_biome)) * place_every_n(21,21,0,0))"
data.raw["simple-entity"]["vulcanus-chimney"].autoplace.probability_expression = "mask_vulcano_coverage(vulcanus_chimney_sulfuric)"
data.raw["simple-entity"]["vulcanus-chimney-faded"].autoplace.probability_expression = "mask_vulcano_coverage(vulcanus_chimney_faded)"
data.raw["simple-entity"]["vulcanus-chimney-cold"].autoplace.probability_expression = "mask_vulcano_coverage(vulcanus_chimney_cold)"
data.raw["simple-entity"]["vulcanus-chimney-short"].autoplace.probability_expression = "mask_vulcano_coverage(vulcanus_chimney_faded / 2)"
data.raw["simple-entity"]["vulcanus-chimney-truncated"].autoplace.probability_expression = "mask_vulcano_coverage(vulcanus_chimney_truncated)"
data.raw["simple-entity"]["huge-volcanic-rock"].autoplace.probability_expression = "mask_vulcano_coverage(vulcanus_rock_huge)"
data.raw["simple-entity"]["big-volcanic-rock"].autoplace.probability_expression = "mask_vulcano_coverage(vulcanus_rock_big)"

-- -- TODO: verify that this code block is actually working
data.raw["optimized-decorative"]["vulcanus-rock-decal-large"].autoplace.probability_expression = "mask_vulcano_terrain(vulcanus_rock_decal_large)"
data.raw["optimized-decorative"]["vulcanus-crack-decal"].autoplace.probability_expression = "mask_vulcano_terrain(vulcanus_crack_decal)"
data.raw["optimized-decorative"]["vulcanus-crack-decal-large"].autoplace.probability_expression = "mask_vulcano_terrain(vulcanus_crack_decal_large)"
data.raw["optimized-decorative"]["vulcanus-crack-decal-huge-warm"].autoplace.probability_expression = "mask_vulcano_terrain(vulcanus_crack_decal_huge_warm)"
data.raw["optimized-decorative"]["vulcanus-crack-decal-warm"].autoplace.probability_expression = "mask_vulcano_terrain(vulcanus_crack_decal_warm)"
data.raw["optimized-decorative"]["calcite-stain"].autoplace.probability_expression = "mask_vulcano_terrain(vulcanus_calcite_stain)"
data.raw["optimized-decorative"]["calcite-stain-small"].autoplace.probability_expression = "mask_vulcano_terrain(vulcanus_calcite_stain_small)"
data.raw["optimized-decorative"]["sulfur-stain"].autoplace.probability_expression = "mask_vulcano_terrain(vulcanus_sulfuric_acid_stain)"
data.raw["optimized-decorative"]["sulfur-stain-small"].autoplace.probability_expression = "mask_vulcano_terrain(vulcanus_sulfuric_acid_stain_small)"
data.raw["optimized-decorative"]["sulfuric-acid-puddle"].autoplace.probability_expression = "mask_vulcano_terrain(vulcanus_sulfuric_acid_puddle)"
data.raw["optimized-decorative"]["sulfuric-acid-puddle-small"].autoplace.probability_expression = "mask_vulcano_terrain(vulcanus_sulfuric_acid_puddle_small)"
data.raw["optimized-decorative"]["crater-small"].autoplace.probability_expression = "mask_vulcano_terrain(crater_small)"
data.raw["optimized-decorative"]["crater-large"].autoplace.probability_expression = "mask_vulcano_terrain(crater_large)"
data.raw["optimized-decorative"]["pumice-relief-decal"].autoplace.probability_expression = "mask_vulcano_terrain(pumice_relief_decal)"
data.raw["optimized-decorative"]["vulcanus-sand-decal"].autoplace.probability_expression = "mask_vulcano_terrain(vulcanus_sand_decal)"
data.raw["optimized-decorative"]["vulcanus-dune-decal"].autoplace.probability_expression = "mask_vulcano_terrain(vulcanus_dune_decal)"
data.raw["optimized-decorative"]["waves-decal"].autoplace.probability_expression = "mask_vulcano_terrain(waves_decal)"
data.raw["optimized-decorative"]["medium-volcanic-rock"].autoplace.probability_expression = "mask_vulcano_terrain(vulcanus_rock_medium)"
data.raw["optimized-decorative"]["small-volcanic-rock"].autoplace.probability_expression = "mask_vulcano_terrain(vulcanus_rock_small)"
data.raw["optimized-decorative"]["tiny-volcanic-rock"].autoplace.probability_expression = "mask_vulcano_terrain(vulcanus_rock_tiny)"
data.raw["optimized-decorative"]["tiny-rock-cluster"].autoplace.probability_expression = "mask_vulcano_terrain(vulcanus_rock_cluster)"
data.raw["optimized-decorative"]["small-sulfur-rock"].autoplace.probability_expression = "mask_vulcano_terrain(vulcanus_small_sulfur_rock)"
data.raw["optimized-decorative"]["tiny-sulfur-rock"].autoplace.probability_expression = "mask_vulcano_terrain(vulcanus_sulfur_rock_tiny)"
data.raw["optimized-decorative"]["sulfur-rock-cluster"].autoplace.probability_expression = "mask_vulcano_terrain(vulcanus_sulfur_rock_cluster)"
data.raw["optimized-decorative"]["vulcanus-lava-fire"].autoplace.probability_expression = "mask_vulcano_terrain(0.1 * (vulcanus_elev <= 0) * (vulcanus_elev > 2) + 0.005 * min(1, max(lava_basalts_range, lava_mountains_range, lava_hot_basalts_range, lava_hot_mountains_range)))"

-- mask_vulcano_terrain("vulcanus-crack-decal-large", "optimized-decorative")
-- mask_vulcano_terrain("vulcanus-crack-decal-huge-warm", "optimized-decorative")
-- mask_vulcano_terrain("vulcanus-crack-decal-warm", "optimized-decorative")
-- mask_vulcano_terrain("calcite-stain", "optimized-decorative")
-- mask_vulcano_terrain("calcite-stain-small", "optimized-decorative")
-- mask_vulcano_terrain("sulfur-stain", "optimized-decorative")
-- mask_vulcano_terrain("sulfur-stain-small", "optimized-decorative")
-- mask_vulcano_terrain("sulfuric-acid-puddle", "optimized-decorative")
-- mask_vulcano_terrain("sulfuric-acid-puddle-small", "optimized-decorative")
-- mask_vulcano_terrain("crater-small", "optimized-decorative")
-- mask_vulcano_terrain("crater-large", "optimized-decorative")
-- mask_vulcano_terrain("pumice-relief-decal", "optimized-decorative")
-- mask_vulcano_terrain("vulcanus-sand-decal", "optimized-decorative")
-- mask_vulcano_terrain("vulcanus-dune-decal", "optimized-decorative")
-- mask_vulcano_terrain("waves-decal", "optimized-decorative")
-- mask_vulcano_terrain("medium-volcanic-rock", "optimized-decorative")
-- mask_vulcano_terrain("small-volcanic-rock", "optimized-decorative")
-- mask_vulcano_terrain("tiny-volcanic-rock", "optimized-decorative")
-- mask_vulcano_terrain("tiny-rock-cluster", "optimized-decorative")
-- mask_vulcano_terrain("small-sulfur-rock", "optimized-decorative")
-- mask_vulcano_terrain("tiny-sulfur-rock", "optimized-decorative")
-- mask_vulcano_terrain("sulfur-rock-cluster", "optimized-decorative")
-- mask_vulcano_terrain("vulcanus-lava-fire", "optimized-decorative")

-- New noise expressions and noise functions
data:extend
({
  -- Noise expressions
  {
    -- To remove the small random lava puddles
    type = "noise-expression",
    name = "offset_vulcano",
    expression = "1"
  },
  {
    -- Noise expression for ring around lava spots
    type = "noise-expression",
    name = "updated_volcanic_folds",
    expression = "10 * range_select_base(mountain_volcano_spots * 1.95 - 0.9, 0.16, 10, 1, 0, 1) - offset_vulcano"  --  Creates ring around lava_hot_mountains_range
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

  -- Noise functions
  {
    -- Mask close surroundings of vulcano
    type = "noise-function",
    name = "mask_vulcano_coverage",
    parameters = {"expression"},
    expression = "if(vulcano_coverage, expression, -inf)"
  },
  {
    -- Mask all vulcanus terrain
    type = "noise-function",
    name = "mask_vulcano_terrain",
    parameters = {"expression"},
    expression = "if(vulcanus_terrain, expression, -inf)"
  },
  {
    -- Mask off close surroundings of vulcano
    type = "noise-function",
    name = "mask_off_vulcano_coverage",
    parameters = {"expression"},
    expression = "if(vulcano_coverage, -inf, expression)"
  },
  {
    -- Mask off all vulcanus terrain
    type = "noise-function",
    name = "mask_off_vulcano_terrain",
    parameters = {"expression"},
    expression = "if(vulcanus_terrain, -inf, expression)"
  },
})
-- END: Update noise expressions

--------------------------------------------------------------------------------
-- MARK: Fix Gleba related map gen settings
--------------------------------------------------------------------------------


-- New noise expressions and noise functions
data:extend
({
  {
    -- Create mask for gleba territory
    type = "noise-expression",
    name = "gleba_mask",
    expression = "if(min(wlc_elevation, -starting_island) > 1, inf, 0)",
    local_expressions = {
      elevation_magnitude = 20,
      wlc_amplitude = 2,
      wlc_elevation = "max(nauvis_main - water_level * wlc_amplitude, starting_island)",
      nauvis_main = "elevation_magnitude * (0.25 * nauvis_detail + 3 * nauvis_macro * starting_macro_multiplier)",
      -- if most of the world is flooded make sure starting areas still have land
      starting_island = "nauvis_main + elevation_magnitude * (2.5 - distance / 300)",
      starting_macro_multiplier = "clamp(distance * segmentation_multiplier / 2000, 0, 1)",
      starting_lake = "elevation_magnitude * (-3 + (starting_lake_distance + starting_lake_noise) / 8) / 8",
      starting_lake_distance = "distance_from_nearest_point{x = x, y = y, points = starting_lake_positions, maximum_distance = 1024}",
      starting_lake_noise = "quick_multioctave_noise_persistence{x = x,\z
                                                                 y = y,\z
                                                                 seed0 = map_seed,\z
                                                                 seed1 = 14,\z
                                                                 input_scale = 1/8,\z
                                                                 output_scale = 0.8,\z
                                                                 octaves = 4,\z
                                                                 octave_input_scale_multiplier = 0.5,\z
                                                                 persistence = 0.68}",
      nauvis_macro = "multioctave_noise{x = x,\z
                                        y = y,\z
                                        persistence = 0.6,\z
                                        seed0 = map_seed + 1,\z
                                        seed1 = 1000,\z
                                        octaves = 2,\z
                                        input_scale = segmentation_multiplier / 5000}\z
                     * max(0, multioctave_noise{x = x,\z
                                        y = y,\z
                                        persistence = 0.6,\z
                                        seed0 = map_seed + 1,\z
                                        seed1 = 1100,\z
                                        octaves = 1,\z
                                        input_scale = segmentation_multiplier / 5000})",
      nauvis_detail = "variable_persistence_multioctave_noise{x = x,\z
                                                              y = y,\z
                                                              seed0 = map_seed + 1,\z
                                                              seed1 = 600,\z
                                                              input_scale = segmentation_multiplier / 14,\z
                                                              output_scale = 0.03,\z
                                                              offset_x = 10000 / segmentation_multiplier,\z
                                                              octaves = 5,\z
                                                              persistence = nauvis_persistance}",
      segmentation_multiplier = "1.5 * control:water:frequency"
    }
  },
})