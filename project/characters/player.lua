--player--
function init_plr()
	player={
	x=63,
	y=63,
	fx=false,
	fy=false,
	dy=0,
	sprt=0,
	sprt_base=0,
	sprt_tmr=0,
	move_spd=0.6,
	attack_spd=0.3,
	jump_force=-3,
	gravity=0.2,
	moving=false,
	attacking=false,
	jumping=false,
	grounded=false,
	fall_attack=false,
	health=3,
	coins=0
	}
	return player
end


function plr_mvmt(plr)
	plr.moving=false
	--horizontal movement
	if btn(➡️) then
		plr.x+=plr.move_spd
		plr.fx=false
		plr.moving=true
		--sfx(0)
	
	elseif btn(⬅️) then
		plr.x-=plr.move_spd
		plr.fx=true
		plr.moving=true
		--sfx(0)
	end
		
	if btnp(🅾️) and not plr.attacking and not plr.fall_attack then
		if not grounded and btn(⬇️) then
			plr.fall_attack=true
			plr.dy=2
		else
			plr.attacking=true
			plr.sprt_tmr=0
			--sfx(2)
		end
	end
	
	if btnp(❎) and plr.grounded then
		plr.dy=plr.jump_force
		plr.grounded=false
		plr.jumping=true
		--sfx(1)
	end
	
	plr.dy+=plr.gravity
	plr.y+=plr.dy
	
	if plr.y>=82 then 
		plr.y=82
		plr.dy=0
		plr.grounded=true
		plr.jumping=false
		plr.fall_attack=false
	end
	
	if plr.fall_attack then
		plr_anm_fall_attack(plr)
	elseif plr.attacking then 
		plr_anm_attack(plr)
	elseif not plr.grounded then
		plr_anm_jump(plr)
	elseif plr.moving then 
		plr_anm_move(plr)	
	else
		plr.sprt=0
		plr.sprt_tmr=0
	end
end


function plr_anm_move(plr)
	--movement left and right
	if plr.sprt<2-plr.move_spd then
		plr.sprt+=plr.move_spd
	else
		plr.moving=false
		plr.sprt=plr.sprt_base
	end
end

function plr_anm_jump(plr)
	if plr.dy<0 then
		plr.sprt=2
	else
		plr.sprt=3
	end
end

function plr_anm_attack(plr)
	--attack
	plr.sprt_tmr+=plr.attack_spd
	plr.sprt=4+flr(plr.sprt_tmr%2)
	if plr.sprt_tmr>1 then
		plr.attacking=false
		plr.sprt_tmr=0
	end
end

function plr_anm_fall_attack(plr)
	--falling attack
	plr.sprt=6
end

---function plr_camera(plr)
---	camera(plr.x,plr.y)
---end

function draw_plr(plr)
	spr(plr.sprt,plr.x,plr.y,1,1,plr.fx,false)
	 print("x:"..plr.x.." y:"..plr.y, 0, 0, 7) 
end