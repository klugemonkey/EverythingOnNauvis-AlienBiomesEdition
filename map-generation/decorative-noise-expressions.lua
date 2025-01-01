
local function noise_expression(name, type)
  return
  {
    type = "noise-expression",
    name = string.gsub(name, "-", "_"),
    expression = data.raw[type][name].autoplace.probability_expression,
    local_expressions = data.raw[type][name].autoplace.local_expressions
  }
end

data:extend({
  noise_expression("big-rock", "simple-entity"),
  noise_expression("brown-asterisk", "optimized-decorative"),
  noise_expression("brown-asterisk-mini", "optimized-decorative"),
  noise_expression("brown-carpet-grass", "optimized-decorative"),
  noise_expression("brown-fluff", "optimized-decorative"),
  noise_expression("brown-fluff-dry", "optimized-decorative"),
  noise_expression("brown-hairy-grass", "optimized-decorative"),
  noise_expression("cracked-mud-decal", "optimized-decorative"),
  noise_expression("dark-mud-decal", "optimized-decorative"),
  -- noise_expression("enemy-decal", "optimized-decorative"),
  noise_expression("garballo", "optimized-decorative"),
  noise_expression("garballo-mini-dry", "optimized-decorative"),
  noise_expression("green-asterisk", "optimized-decorative"),
  noise_expression("green-asterisk-mini", "optimized-decorative"),
  noise_expression("green-bush-mini", "optimized-decorative"),
  noise_expression("green-carpet-grass", "optimized-decorative"),
  noise_expression("green-croton", "optimized-decorative"),
  noise_expression("green-desert-bush", "optimized-decorative"),
  noise_expression("green-hairy-grass", "optimized-decorative"),
  noise_expression("green-pita", "optimized-decorative"),
  noise_expression("green-pita-mini", "optimized-decorative"),
  noise_expression("green-small-grass", "optimized-decorative"),
  noise_expression("huge-rock", "simple-entity"),
  noise_expression("lichen-decal", "optimized-decorative"),
  noise_expression("light-mud-decal", "optimized-decorative"),
  noise_expression("medium-rock", "optimized-decorative"),
  -- noise_expression("muddy-stump", "optimized-decorative"),
  -- noise_expression("nuclear-ground-patch", "optimized-decorative"),
  noise_expression("red-asterisk", "optimized-decorative"),
  noise_expression("red-croton", "optimized-decorative"),
  noise_expression("red-desert-bush", "optimized-decorative"),
  noise_expression("red-desert-decal", "optimized-decorative"),
  noise_expression("red-pita", "optimized-decorative"),
  noise_expression("sand-decal", "optimized-decorative"),
  noise_expression("sand-dune-decal", "optimized-decorative"),
  -- noise_expression("sand-rock", "optimized-decorative"),  -- does not exist in main game
  noise_expression("shroom-decal", "optimized-decorative"),
  noise_expression("small-rock", "optimized-decorative"),
  noise_expression("tiny-rock", "optimized-decorative"),
  noise_expression("white-desert-bush", "optimized-decorative"),
  -- noise_expression("worms-decal", "optimized-decorative"),
})
