-- banishers/register.lua
-- Do the actual registerations
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

if core.get_modpath("default") then
	banisters.register("banisters", "wood", "default:wood")
	banisters.register("banisters", "acacia", "default:acacia_wood")
	banisters.register("banisters", "aspen", "default:aspen_wood")
	banisters.register("banisters", "junglewood", "default:junglewood")
	banisters.register("banisters", "pine", "default:pine_wood")
	banisters.register("banisters", "stone", "default:stone")
	banisters.register("banisters", "desertstone", "default:desert_stone")
	banisters.register("banisters", "sandstone", "default:sandstone")
	banisters.register("banisters", "desert_sandstone", "default:desert_sandstone")
	banisters.register("banisters", "silver_sandstone", "default:silver_sandstone")
end

if core.get_modpath("ethereal") then
	banisters.register("banisters", "bamboo", "ethereal:bamboo_block")
	banisters.register("banisters", "banana", "ethereal:banana_wood")
	banisters.register("banisters", "birch", "ethereal:birch_wood")
	banisters.register("banisters", "frost", "ethereal:frost_wood")
	banisters.register("banisters", "olive", "ethereal:olive_wood")
	banisters.register("banisters", "palm", "ethereal:palm_wood")
	banisters.register("banisters", "redwood", "ethereal:redwood_wood")
	banisters.register("banisters", "sakura", "ethereal:sakura_wood")
	banisters.register("banisters", "willow", "ethereal:willow_wood")
	banisters.register("banisters", "yellow", "ethereal:yellow_wood")
end

if core.get_modpath("maple") then
	banisters.register("banisters", "maple", "maple:maple_wood")
end

if core.get_modpath("moretrees") and moretrees.enable_planks then
	for treename, treedata in pairs(moretrees.treedesc) do
		if treedata.planks then
			banisters.register("banisters", treename, "moretrees:" .. treename .. "_planks")
		end
	end
end
