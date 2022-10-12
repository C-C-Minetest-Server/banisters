local S = banisters.intllib

if minetest.get_modpath("default") then
	banisters.register("wood", "default_wood.png")
	banisters.register("acacia", "default_acacia_wood.png")
	banisters.register("aspen", "default_aspen_wood.png")
	banisters.register("junglewood", "default_junglewood.png")
	banisters.register("pine", "default_pine_wood.png")
	banisters.register("stone", "default_stone.png")
	banisters.register("desertstone", "default_desert_stone.png")
	banisters.register("sandstone", "default_sandstone.png")
	banisters.register("desert_sandstone", "default_desert_sandstone.png")
	banisters.register("silver_sandstone", "default_silver_sandstone.png")
end

if minetest.get_modpath("ethereal") then
	banisters.register("bamboo", "bamboo_floor.png")
	banisters.register("banana", "banana_wood.png")
	banisters.register("birch", "moretrees_birch_wood.png")
	banisters.register("frost", "frost_wood.png")
	banisters.register("mushroom", "mushroom_trunk.png")
	banisters.register("olive", "olive_wood.png")
	banisters.register("palm", "moretrees_palm_wood.png")
	banisters.register("redwood", "redwood_wood.png")
	banisters.register("sakura", "ethereal_sakura_wood.png")
	banisters.register("willow", "willow_wood.png")
	banisters.register("yellow", "yellow_wood.png")
end
