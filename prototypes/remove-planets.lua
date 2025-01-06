local data_util = require("data-util")

-- Remove planets

-- data.raw.planet["aquilo"].map_gen_settings = nil
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
data_util.delete_prototype("space-connection", "aquilo-solar-system-edge")

-- delete technologies
data_util.hide_prototype("technology", "planet-discovery-aquilo")
data_util.hide_prototype("technology", "planet-discovery-fulgora")
data_util.hide_prototype("technology", "planet-discovery-gleba")
data_util.hide_prototype("technology", "planet-discovery-vulcanus")

-- data_util.hide_prototype("technology", "calcite-processing")
-- data_util.hide_prototype("technology", "tungsten-carbide")

-- delete autoplace controlls
-- data.raw["resource"]["aquilo-crude-oil"].autoplace = nil
-- data.raw["noise-expression"]["aquilo_crude_oil_probability"].expression = "0"
-- data.raw["noise-expression"]["aquilo_crude_oil_richness"].expression = "0"
-- data.raw["resource"]["scrap"].autoplace = nil
data.raw["autoplace-control"]["aquilo_crude_oil"] = nil
data.raw["resource"]["scrap"].autoplace = nil  -- why is this needed? who knows... moving on...
data.raw["autoplace-control"]["scrap"] = nil
data.raw["autoplace-control"]["fulgora_cliff"] = nil
data.raw["autoplace-control"]["fulgora_islands"] = nil
data.raw["autoplace-control"]["gleba_stone"] = nil
data.raw["autoplace-control"]["gleba_cliff"] = nil
data.raw["autoplace-control"]["vulcanus_coal"] = nil
