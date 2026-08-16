local tool = {}

function tool:read_product()
	local f = io.open("/sys/class/dmi/id/product_name", "r")
	if not f then
		return nil
	end
	local content = f:read("*l")
	f:close()
	return content
end

return tool
