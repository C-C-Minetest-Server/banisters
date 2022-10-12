local S = banisters.intllib

-- nodeboxes taken from VanessaE's homedecor
local cbox_d = {
	type = "fixed",
	fixed = { -9/16, -3/16, 5/16, 9/16, 24/16, 8/16 }
}

local cbox_h = {
	type = "fixed",
	fixed = { -8/16, -8/16, 5/16, 8/16, 8/16, 8/16 }
}
		
function banisters.register(material, name, style, texture)
	minetest.register_node("banisters:".. material .. "_horizontal", {
		description = S(name .. " Straight Banister"),
		drawtype = "mesh",
		selection_box = cbox_h,
		collision_box = cbox_h,
		paramtype = "light",
		paramtype2 = "facedir",
		groups = {snappy = 2},
		drawtype = "mesh",
		mesh = style .. "_horizontal.obj",
		tiles = {texture}
	})
	
	minetest.register_node("banisters:".. material .. "_diagonal_left", {
		description = S(name .. " Diagonal Banister (left)"),
		drawtype = "mesh",
		selection_box = cbox_d,
		collision_box = cbox_d,
		paramtype = "light",
		paramtype2 = "facedir",
		groups = {snappy = 2},
		drawtype = "mesh",
		mesh = style .. "_diagonal_left.obj",
		tiles = {texture}
	})
	
	minetest.register_node("banisters:".. material .. "_diagonal_right", {
		description = S(name .. " Diagonal Banister (right)"),
		drawtype = "mesh",
		selection_box = cbox_d,
		collision_box = cbox_d,
		paramtype = "light",
		paramtype2 = "facedir",
		groups = {snappy = 2},
		drawtype = "mesh",
		mesh = style .. "_diagonal_right.obj",
		tiles = {texture}
	})
end
