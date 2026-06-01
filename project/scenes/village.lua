-- first scene --
function draw_village(current_map)
	map(current_map.x, current_map.y, 0, 0, 16, 16)
	-- sea
	rectfill(0,0,127,61,12)

	-- clouds
	spr(73,10,10,2,2)
	spr(73,50,20,2,2)
	spr(73,90,15,2,2)

	-- grass
	rectfill(0,62,127,90,11)	

	-- mountains
	acc_mountains=0
	for c=0,7 do
		spr(137,acc_mountains,46,2,2)
		acc_mountains+=16
	end

	spr(139,50,45,2,2)
	spr(139,60,41,2,2)
	spr(139,70,43,2,2)

	spr(141,18,45,2,2)
	spr(141,90,46,2,2)

	-- Buildings
	-- Cemitery
	spr(78,24,65,2,2)
	-- Big Houses
	spr(107,20,72,2,2)
	spr(109,60,72,2,2)
	-- Small Houses
	spr(111,80,64)
	spr(100,10,58)
	spr(111,80,64)
	
	spr(127,90,75)
	spr(127,100,64)

	-- Trees
	spr(84,55,65)
	spr(84,115,70)

	-- little bushes and flowers (Sprite 99)
	-- Bush
	sspr(24,48,5,3,6,76)
	sspr(24,48,5,3,40,80)
	sspr(24,48,5,3,46,74)
	sspr(24,48,5,3,70,70)
	sspr(24,48,5,3,90,65)
	sspr(24,48,5,3,110,80)
	-- Flowers
	-- Red Flower
	sspr(29,48,4,3,76,68)
	sspr(29,48,4,3,86,80)
	sspr(29,48,4,3,108,69)
	-- Yellow Flower
	sspr(26,53,4,3,89,69)
	sspr(26,53,4,3,99,79)
	-- White Flower
	sspr(29,53,4,3,20,68)
	sspr(29,53,4,3,19,72)
	sspr(29,53,4,3,40,67)
	sspr(29,53,4,3,41,73)

	-- Orange Flower
	sspr(23,53,4,3,2,80)
	sspr(23,53,4,3,53,78)
	sspr(23,53,4,3,120,83)


	-- Road
	acc1=0
	for c=0,16 do
		sspr(32,32,8,8,acc1,88)
		acc1+=8
	end

end