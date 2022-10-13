if minetest.get_modpath("default") then
	banisters.register("wood", "default_wood.png", "default:wood")
	banisters.register("acacia", "default_acacia_wood.png", "default:acacia_wood")
	banisters.register("aspen", "default_aspen_wood.png", "default:aspen_wood")
	banisters.register("junglewood", "default_junglewood.png", "default:junglewood")
	banisters.register("pine", "default_pine_wood.png", "default:pine_wood")
	banisters.register("stone", "default_stone.png", "default:stone")
	banisters.register("desertstone", "default_desert_stone.png", "default:desert_stone")
	banisters.register("sandstone", "default_sandstone.png", "default:sandstone")
	banisters.register("desert_sandstone", "default_desert_sandstone.png", "default:desert_sandstone")
	banisters.register("silver_sandstone", "default_silver_sandstone.png", "default:silver_sandstone")
end

if minetest.get_modpath("ethereal") then
	banisters.register("bamboo", "bamboo_floor.png", "ethereal:bamboo_block")
	banisters.register("banana", "banana_wood.png", "ethereal:banana_wood")
	banisters.register("birch", "moretrees_birch_wood.png", "ethereal:birch_wood")
	banisters.register("frost", "frost_wood.png", "ethereal:frost_wood")
	banisters.register("olive", "olive_wood.png", "ethereal:olive_wood")
	banisters.register("palm", "moretrees_palm_wood.png", "ethereal:palm_wood")
	banisters.register("redwood", "redwood_wood.png", "ethereal:redwood_wood")
	banisters.register("sakura", "ethereal_sakura_wood.png", "ethereal:sakura_wood")
	banisters.register("willow", "willow_wood.png", "ethereal:willow_wood")
	banisters.register("yellow", "yellow_wood.png", "ethereal:yellow_wood")
end

if minetest.get_modpath("maple") then
	banisters.register("maple", "maple_wood.png", "maple:maple_wood")
end
