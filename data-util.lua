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

return data_util
