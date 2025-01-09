
-- Fix tech tree
-- Aquilo
data.raw.technology["heating-tower"].prerequisites = {"nuclear-power"}

-- Gleba
data.raw.technology["agriculture"].prerequisites = {"landfill", "steel-processing"}

-- Fulgora
data.raw.technology["holmium-processing"].research_trigger = {type = "mine-entity", entity = "holmium-ore"}
data.raw.technology["recycling"].prerequisites = {"processing-unit", "production-science-pack"}
data.raw.technology["recycling"].research_trigger = nil
data.raw.technology["recycling"].unit = {
  count = 100,
  ingredients = {
    {"automation-science-pack", 1},
    {"logistic-science-pack", 1},
    {"chemical-science-pack", 1},
    {"production-science-pack", 1}
  },
  time = 5
}


-- Vulcanus
data.raw.technology["calcite-processing"].prerequisites = {"production-science-pack"}
data.raw.technology["calcite-processing"].research_trigger = nil
data.raw.technology["calcite-processing"].unit = {
  count = 100,
  ingredients = {
    {"automation-science-pack", 1},
    {"logistic-science-pack", 1},
    {"chemical-science-pack", 1},
    {"production-science-pack", 1}
  },
  time = 5
}
data.raw.technology["tungsten-carbide"].prerequisites = {"production-science-pack"}
data.raw.technology["tungsten-carbide"].research_trigger = nil
data.raw.technology["tungsten-carbide"].unit = {
  count = 100,
  ingredients = {
    {"automation-science-pack", 1},
    {"logistic-science-pack", 1},
    {"chemical-science-pack", 1},
    {"production-science-pack", 1}
  },
  time = 5
}
