
-- Remove surface conditions for every recipe
for _, category in pairs(data.raw) do
    for name, data in pairs(category) do
        if data.surface_conditions then
            data.surface_conditions = nil
        end
    end
end
