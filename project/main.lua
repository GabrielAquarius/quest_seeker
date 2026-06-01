-- main --
function _init()
	init_menu()
	init_plr()
	scene="village"
	current_map={
        x=16,
        x=0
    }
end

function _update()
	if state=="menu" then
		menu_animation()
		if btnp(🅾️) or btnp(❎) then
		 state="game"
		end
	elseif state=="game" then
		plr_mvmt(player)
		change_scenes(player)
	end
end

function _draw()
	cls()
	if state=="menu" then
		draw_menu()
		print("press 🅾️ or ❎ to start",23,60)
	elseif state=="game" then
		cls()
		if scene=="village" then
            draw_village(current_map)
        elseif scene=="forest" then
            draw_forest(current_map)
        end
		
		draw_plr(player)

	end
end
