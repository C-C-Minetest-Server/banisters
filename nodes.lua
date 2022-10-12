local S = banisters.intllib

function banisters.register(material, texture)	

	local types = {
		"_horizontal",
		"_diagonal_left",
		"_diagonal_right"
	}

	local styles = {
		"basic",
		"fancy"
	}

	for i, s in pairs(styles)
	do
		for j, t in pairs(types)
		do
			local itemstring = string.format("banisters:%s_%s%s", material, s, t)

			-- nodeboxes taken from VanessaE's homedecor
			local cbox = {
				type = "fixed",
				fixed = { -9/16, -3/16, 5/16, 9/16, 24/16, 8/16 }
			}		
			
			if t == "_horizontal" then
				cbox.fixed = { -8/16, -8/16, 5/16, 8/16, 8/16, 8/16 }
			end
	
			minetest.register_node(itemstring, {
				description = S(s .. " " .. material .. " banister"),
				drawtype = "mesh",	
				selection_box = cbox,
				collision_box = cbox,
				paramtype = "light",
				paramtype2 = "facedir",
				groups = {snappy = 3},
				drawtype = "mesh",
				mesh = s .. t .. ".obj",
				tiles = {texture}
			})
		end
	end
end
