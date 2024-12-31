local data_util = require("data-util")

--------------------------------------------------------------------------------
-- MARK: Remove Vulcanus
--------------------------------------------------------------------------------

data.raw.planet["vulcanus"].map_gen_settings = nil
if data.raw.planet["vulcanus"] then
  data.raw.planet["vulcanus"].hidden = true
end

data_util.delete_prototype("space-connection", "vulcanus-gleba")
data_util.delete_prototype("space-connection", "nauvis-vulcanus")


data_util.hide_prototype("technology", "planet-discovery-vulcanus")
-- data_util.hide_prototype("technology", "calcite-processing")
-- data_util.hide_prototype("technology", "tungsten-carbide")
