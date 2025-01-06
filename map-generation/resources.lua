
local resource_autoplace = require("resource-autoplace")
local base_sounds = require("__base__.prototypes.entity.sounds")

local stone_driving_sound = {
  sound = {
    filename = "__base__/sound/driving/vehicle-surface-stone.ogg", volume = 0.8,
    advanced_volume_control = {fades = {fade_in = {curve_type = "cosine", from = {control = 0.5, volume_percentage = 0.0}, to = {1.5, 100.0 }}}}
  },
  fade_ticks = 6
}


data:extend({
  {
    type = "autoplace-control",
    name = "holmium-ore",
    localised_name = {"", "[entity=holmium-ore] ", {"entity-name.holmium-ore"}},
    richness = true,
    order = "b-c",
    category = "resource"
  },
  {
    type = "resource",
    name = "holmium-ore",
    icon = "__space-age__/graphics/icons/holmium-ore.png",
    flags = {"placeable-neutral"},
    order = "a-b-e",
    tree_removal_probability = 0.7,
    tree_removal_max_distance = 32 * 32,
    walking_sound = base_sounds.ore,
    driving_sound = stone_driving_sound,
    minable =
    {
    mining_particle = "stone-particle",
    mining_time = 2,
    result = "holmium-ore",
    },
    category = "hard-solid",
    collision_box = {{-0.1, -0.1}, {0.1, 0.1}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    autoplace = resource_autoplace.resource_autoplace_settings
    {
    name = "holmium-ore",
    order = "c",
    base_density = 0.9,
    base_spots_per_km2 = 1.25,
    has_starting_area_placement = false,
    random_spot_size_minimum = 2,
    random_spot_size_maximum = 4,
    regular_rq_factor_multiplier = 1
    },
    stage_counts = {10000, 6330, 3670, 1930, 870, 270, 100, 50},
    stages =
    {
    sheet =
    {
      filename = "__EverythingOnNauvis__/graphics/holmium-ore-patches.png",
      priority = "extra-high",
      width = 128,
      height = 128,
      frame_count = 8,
      variation_count = 8,
      scale = 0.5
    }
    },
    effect_animation_period = 5,
    effect_animation_period_deviation = 1,
    effect_darkness_multiplier = 3.6,
    min_effect_alpha = 0.2,
    max_effect_alpha = 0.3,
    mining_visualisation_tint = {r = 1, g = 0, b = 0.9, a = 1},
    map_color = {1, 0, 0.9}
  },
})
