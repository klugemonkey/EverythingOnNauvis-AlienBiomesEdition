local data_util = {}

function data_util.hide_prototype(type, name)
  if data.raw[type][name] then
	  data.raw[type][name].hidden = true
  end
end

function data_util.delete_prototype(type, name)
  if data.raw[type][name] then
	  data.raw[type][name] = nil
  end
end

function data_util.generate_eon_name(name)
  -- eon for everything on nauvis
  return "eon_" .. string.gsub(name, "-", "_")
end

function data_util.has_expression(type, name)
  if data.raw[type] == nil then
    log("Missing type definition \"".. type .. "\"")
    return false
  end
  if data.raw[type][name] == nil then
    log("Missing prototype data.raw[\"".. type .. "\"][\"" .. name .. "\"]")
    return false
  end
  if data.raw[type][name].autoplace == nil then
    log("Missing autoplace specification for data.raw[\"".. type .. "\"][\"" .. name .. "\"]")
    return false
  end
  if data.raw[type][name].autoplace.probability_expression == nil then
    log("Missing probability_expression in autoplace specification for data.raw[\"".. type .. "\"][\"" .. name .. "\"]")
    return false
  end
  return true
end


return data_util
