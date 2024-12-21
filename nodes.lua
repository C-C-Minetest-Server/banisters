-- banishers/nodes.lua
-- Node registeration functiosn
--[[
	Banishers: Adds straight and diagonal banisters for stairs railings.
    Copyright (C) 2022  Álex Romeo Echo <re5@disroot.org>
	Copyright (C) 2024  1F616EMO <root@1f616emo.xyz>

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU Lesser General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU Lesser General Public License for more details.

    You should have received a copy of the GNU Lesser General Public License
    along with this program.  If not, see <https://www.gnu.org/licenses/>.
]]

local S = banisters.intllib

-- Chooses banister side according to yaw direction.
-- (Code snippet taken from display_modpack by pyrollo).
function banisters.on_place_side(itemstack, placer, pointed_thing)
	local name = itemstack:get_name()
	local ndef = core.registered_nodes[name]

	local bdir = {
		x = pointed_thing.under.x - pointed_thing.above.x,
		y = pointed_thing.under.y - pointed_thing.above.y,
		z = pointed_thing.under.z - pointed_thing.above.z
	}
	local pdir = placer:get_look_dir()

	local ndir, test

	if ndef.paramtype2 == "facedir" then
		if bdir.x == 0 and bdir.z == 0 then
			-- Ceiling or floor pointed (facedir chosen from player dir)
			ndir = core.dir_to_facedir({ x = pdir.x, y = 0, z = pdir.z })
			return core.item_place(itemstack, placer, pointed_thing, ndir)
		else
			-- Wall pointed
			ndir = core.dir_to_facedir(bdir)
		end

		test = { [0] = -pdir.x, pdir.z, pdir.x, -pdir.z }
	end

	-- Horizontal banisters will become diagonal if they're placed diagonally.
	if name:sub(-4) == "ntal" then
		if test[ndir] > 0.5 then
			itemstack:set_name(name:sub(1, -11) .. "diagonal_left")
		elseif test[ndir] < -0.5 then
			itemstack:set_name(name:sub(1, -11) .. "diagonal_right")
		end
		itemstack = core.item_place(itemstack, placer, pointed_thing, ndir)
		itemstack:set_name(name)

		return itemstack
	else
		return core.item_place(itemstack, placer, pointed_thing, ndir)
	end
end

local keep_groups = {
	-- General groups
	"not_in_creative_inventory",

	-- Minetest Game dig groups
	"crumby", "cracky", "snappy", "choppy", "fleshy", "explody", "oddly_breakable_by_hand", "dig_immediate",

	-- MineClone2 dig groups
	"pickaxey", "axey", "shovely", "swordly", "shearsy", "handy", "creative_breakable",

	-- MineClone2 interaction groups
	"flammable", "fire_encouragement", "fire_flammability",
}
local function prepare_groups(groups)
	if not groups then return {} end

	local rtn = {}
	for _, key in ipairs(keep_groups) do
		rtn[key] = groups[key]
	end
	return rtn
end

-- Node register function
function banisters.register(mod_name, tech_name, orig_node)
	local types = {
		"_horizontal",
		"_diagonal_left",
		"_diagonal_right"
	}

	local styles = {
		"basic",
		"fancy"
	}

	mod_name = mod_name or core.get_current_modname()

	for _, s in pairs(styles) do
		for _, t in pairs(types) do
			local itemstring = string.format(":%s:%s_%s%s", mod_name, tech_name, s, t)

			-- nodeboxes taken from VanessaE's homedecor
			local cbox = {
				type = "fixed",
				fixed = { -9 / 16, -3 / 16, 5 / 16, 9 / 16, 24 / 16, 8 / 16 }
			}

			local ndef = assert(core.registered_nodes[orig_node], "Node " .. orig_node .. " not found")
			local g = prepare_groups(ndef.groups)
			local name = ndef.description or tech_name
			local desc

			if t == "_horizontal" then
				cbox.fixed = { -8 / 16, -8 / 16, 5 / 16, 8 / 16, 8 / 16, 8 / 16 }

				if s == "basic" then
					desc = S("Basic @1 banister", name)
					core.register_craft({
						output = string.format("banisters:%s_basic_horizontal 3", tech_name),
						recipe = {
							{ orig_node,     orig_node, orig_node },
							{ 'group:stick', '',        'group:stick' }
						}
					})
				elseif s == "fancy" then
					desc = S("Fancy @1 banister", name)
					core.register_craft({
						output = string.format("banisters:%s_fancy_horizontal 3", tech_name),
						recipe = {
							{ orig_node,     orig_node,     orig_node },
							{ 'group:stick', 'group:stick', 'group:stick' }
						}
					})
				end
			else
				g.not_in_creative_inventory = 1
			end


			core.register_node(itemstring, {
				description = desc,
				selection_box = cbox,
				collision_box = cbox,
				paramtype = "light",
				paramtype2 = "facedir",
				on_place = banisters.on_place_side,
				groups = g,
				drawtype = "mesh",
				mesh = s .. t .. ".obj",
				tiles = ndef.tiles,
				sounds = ndef.sounds,
				drop = string.format("banisters:%s_%s_horizontal", tech_name, s)
			})
		end
	end
end
