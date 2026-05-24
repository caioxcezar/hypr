function RunCommand(cmd)
	local handle = io.popen(cmd)
	if handle == nil then
		return ""
	end
	local result = handle:read("*a")
	handle:close()
	return result
end

function Trim(str)
	return (str:gsub("^%s*(.-)%s*$", "%1"))
end

function Merge(table1, table2)
	for key, value in pairs(table2) do
		table1[key] = value
	end
	return table1
end
