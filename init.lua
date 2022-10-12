banisters = {}
local path = minetest.get_modpath("banisters")
local S = minetest.get_translator and minetest.get_translator("banisters") or dofile(path .. "/intllib.lua")
banisters.intllib = S

dofile(minetest.get_modpath("banisters").."/nodes.lua")
dofile(minetest.get_modpath("banisters").."/crafts.lua")
