
-- Fix tech tree
data.raw.technology["holmium-processing"].research_trigger = {type = "mine-entity", entity = "holmium-ore"}
data.raw.technology["recycling"].prerequisites = {"processing-unit"}
