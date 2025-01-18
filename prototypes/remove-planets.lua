local data_util = require("data-util")
local asteroid_util = require("__space-age__.prototypes.planet.asteroid-spawn-definitions")

-- Remove planets

data.raw.planet["aquilo"].map_gen_settings = nil
if data.raw.planet["aquilo"] then
  data.raw.planet["aquilo"].hidden = true
end

data.raw.planet["fulgora"].map_gen_settings = nil
if data.raw.planet["fulgora"] then
  data.raw.planet["fulgora"].hidden = true
end

data.raw.planet["gleba"].map_gen_settings = nil
if data.raw.planet["gleba"] then
  data.raw.planet["gleba"].hidden = true
end

data.raw.planet["vulcanus"].map_gen_settings = nil
if data.raw.planet["vulcanus"] then
  data.raw.planet["vulcanus"].hidden = true
end

-- delete space connections
data_util.delete_prototype("space-connection", "nauvis-vulcanus")
data_util.delete_prototype("space-connection", "nauvis-gleba")
data_util.delete_prototype("space-connection", "nauvis-fulgora")
data_util.delete_prototype("space-connection", "vulcanus-gleba")
data_util.delete_prototype("space-connection", "gleba-fulgora")
data_util.delete_prototype("space-connection", "gleba-aquilo")
data_util.delete_prototype("space-connection", "fulgora-aquilo")
data.raw["space-connection"]["aquilo-solar-system-edge"].from = "nauvis"
-- data_util.delete_prototype("space-connection", "aquilo-solar-system-edge")

-- remove space age menu simulations
data.raw["utility-constants"]["default"].main_menu_simulations.nauvis_artillery = nil
data.raw["utility-constants"]["default"].main_menu_simulations.nauvis_oil_refinery = nil
data.raw["utility-constants"]["default"].main_menu_simulations.train_junction = nil
data.raw["utility-constants"]["default"].main_menu_simulations.nauvis_train_station = nil
data.raw["utility-constants"]["default"].main_menu_simulations.nauvis_train_junction = nil
data.raw["utility-constants"]["default"].main_menu_simulations.platform_science = nil
data.raw["utility-constants"]["default"].main_menu_simulations.platform_moving = nil
data.raw["utility-constants"]["default"].main_menu_simulations.platform_messy_nuclear = nil
data.raw["utility-constants"]["default"].main_menu_simulations.vulcanus_lava_forge = nil
data.raw["utility-constants"]["default"].main_menu_simulations.vulcanus_crossing = nil
data.raw["utility-constants"]["default"].main_menu_simulations.vulcanus_punishmnent = nil
data.raw["utility-constants"]["default"].main_menu_simulations.vulcanus_sulfur_drop = nil
data.raw["utility-constants"]["default"].main_menu_simulations.gleba_agri_towers = nil
data.raw["utility-constants"]["default"].main_menu_simulations.gleba_pentapod_ponds = nil
data.raw["utility-constants"]["default"].main_menu_simulations.gleba_egg_escape = nil
data.raw["utility-constants"]["default"].main_menu_simulations.gleba_farm_attack = nil
data.raw["utility-constants"]["default"].main_menu_simulations.gleba_grotto = nil
data.raw["utility-constants"]["default"].main_menu_simulations.fulgora_city_crossing = nil
data.raw["utility-constants"]["default"].main_menu_simulations.fulgora_recycling_hell = nil
data.raw["utility-constants"]["default"].main_menu_simulations.fulgora_nightfall = nil
data.raw["utility-constants"]["default"].main_menu_simulations.fulgora_race = nil
data.raw["utility-constants"]["default"].main_menu_simulations.aquilo_send_help = nil
data.raw["utility-constants"]["default"].main_menu_simulations.aquilo_starter = nil

-- delete technologies
data_util.hide_prototype("technology", "planet-discovery-aquilo")
data_util.hide_prototype("technology", "planet-discovery-fulgora")
data_util.hide_prototype("technology", "planet-discovery-gleba")
data_util.hide_prototype("technology", "planet-discovery-vulcanus")

data.raw["autoplace-control"]["aquilo_crude_oil"] = nil
data.raw["resource"]["scrap"].autoplace = nil  -- why is this needed? who knows... moving on...
data.raw["autoplace-control"]["scrap"] = nil
data.raw["autoplace-control"]["fulgora_cliff"] = nil
data.raw["autoplace-control"]["fulgora_islands"] = nil
data.raw["autoplace-control"]["gleba_stone"] = nil
data.raw["autoplace-control"]["gleba_cliff"] = nil
data.raw["autoplace-control"]["vulcanus_coal"] = nil
