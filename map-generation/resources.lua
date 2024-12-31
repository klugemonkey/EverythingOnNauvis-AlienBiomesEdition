--------------------------------------------------------------------------------
-- Fixes map generation for resources
--------------------------------------------------------------------------------
require("map-generation.terrain")
-- local sounds = require("__base__.prototypes.entity.sounds")
-- local simulations = require("__space-age__.prototypes.factoriopedia-simulations")
-- local resources = require("__base__.prototypes.entity.resources")

--------------------------------------------------------------------------------
-- MARK: Fix Vulcanus resources
--------------------------------------------------------------------------------

-- property_expression_names
data.raw.planet["nauvis"].map_gen_settings.property_expression_names["entity:calcite:probability"] = "vulcanus_calcite_probability"
data.raw.planet["nauvis"].map_gen_settings.property_expression_names["entity:calcite:richness"] = "vulcanus_calcite_richness"
data.raw.planet["nauvis"].map_gen_settings.property_expression_names["entity:sulfuric-acid-geyser:probability"] = "vulcanus_sulfuric_acid_geyser_probability"
data.raw.planet["nauvis"].map_gen_settings.property_expression_names["entity:sulfuric-acid-geyser:richness"] = "vulcanus_sulfuric_acid_geyser_richness"
data.raw.planet["nauvis"].map_gen_settings.property_expression_names["entity:tungsten-ore:probability"] = "vulcanus_tungsten_ore_probability"
data.raw.planet["nauvis"].map_gen_settings.property_expression_names["entity:tungsten-ore:richness"] = "vulcanus_tungsten_ore_richness"

-- Add resources to nauvis
data.raw.planet["nauvis"].map_gen_settings.autoplace_settings.entity.settings["calcite"] = {}
data.raw.planet["nauvis"].map_gen_settings.autoplace_settings.entity.settings["sulfuric-acid-geyser"] = {}
data.raw.planet["nauvis"].map_gen_settings.autoplace_settings.entity.settings["tungsten-ore"] = {}

-- autoplace_controls
data.raw.planet["nauvis"].map_gen_settings.autoplace_controls["calcite"] = {}
data.raw.planet["nauvis"].map_gen_settings.autoplace_controls["sulfuric_acid_geyser"] = {}
data.raw.planet["nauvis"].map_gen_settings.autoplace_controls["tungsten_ore"] = {}

-- START: Fix Resource spawning
data.raw.resource["calcite"].autoplace.has_starting_area_placement = false -- Does nothing but noise expression vulcanus_starting_calcite removes starter spot
data.raw["noise-expression"]["vulcanus_starting_calcite"].expression = "-inf"

data.raw.resource["sulfuric-acid-geyser"].autoplace.has_starting_area_placement = false -- Does nothing but noise expression vulcanus_starting_sulfur removes starter spot
data.raw["noise-expression"]["vulcanus_starting_sulfur"].expression = "-inf"
-- END: Fix Resource spawning

-- START: Update noise expressions
-- Make calcite spawn similar to nauvis ores
data.raw.resource["calcite"].autoplace.base_density = 10
data.raw.resource["calcite"].autoplace.regular_rq_factor_multiplier = 1.1
data.raw.resource["calcite"].autoplace.starting_rq_factor_multiplier = 1.5
data.raw.resource["calcite"].autoplace.candidate_spot_count = 22
-- data.raw["noise-expression"]["vulcanus_calcite_probability"].expression = "(control:calcite:size > 0) * (1000 * ((0.5 + vulcanus_calcite_region) * random_penalty_between(0.9, 1, 1) - 1))"

-- sulfuric-acid-geyser will only spawn around volcano and only rarely.
data.raw["noise-expression"]["vulcanus_sulfuric_acid_geyser_probability"].expression = "(control:sulfuric_acid_geyser:size > 0) * (0.005 * ((vulcanus_sulfuric_acid_region_patchy > 0) + 2 * updated_volcanic_folds))"

-- Make tunsten ore spawn similar to nauvis ores
data.raw.resource["tungsten-ore"].autoplace.base_density = 10
data.raw.resource["tungsten-ore"].autoplace.regular_rq_factor_multiplier = 1.1
data.raw.resource["tungsten-ore"].autoplace.starting_rq_factor_multiplier = 1.5
data.raw.resource["tungsten-ore"].autoplace.candidate_spot_count = 22
-- data.raw["noise-expression"]["vulcanus_tungsten_ore_probability"].expression = "(control:tungsten_ore:size > 0) * (1000 * ((0.7 + vulcanus_tungsten_ore_region) * random_penalty_between(0.9, 1, 1) - 1))"
-- END: Update noise expressions


data.raw.resource["calcite"].autoplace.base_density = 10
data.raw.resource["calcite"].autoplace.regular_rq_factor_multiplier = 1.1
data.raw.resource["calcite"].autoplace.starting_rq_factor_multiplier = 1.5
data.raw.resource["calcite"].autoplace.candidate_spot_count = 22

-- -- data.raw.resource["tunsten-ore"] = nil
-- data:extend({
--   resources.resource({
--       name = "tungsten-ore",
--       order = "b",
--       map_color = {r = 98/256, g = 86/256, b = 150/256, a = 1.000},
--       mining_time = 5,
--       walking_sound = sounds.ore,
--       mining_visualisation_tint = {r = 150/256, g = 150/256, b = 180/256, a = 1.000},
--       category = "hard-solid",
--       factoriopedia_simulation = simulations.factoriopedia_tungsten_ore,
--     },
--     {
--       base_density = 10,
--       regular_rq_factor_multiplier = 1.10,
--       starting_rq_factor_multiplier = 1.5,
--       candidate_spot_count = 22, -- To match 0.17.50 placement
--     }
--   )
-- })