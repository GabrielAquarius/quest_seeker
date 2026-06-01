-- menu --
function init_menu()
	figures={
		x_plr=0,
		y_plr=82,
		fx_plr=false,
		fy_plr=false,
		tmr_plr=0,
		sprt_plr=0,
		is_plr_att=false,
		
		x_mob=128,
		y_mob=82,
	 tmr_mob=0,
	 jmp_mob=0,
	 sprt_mob=48,
	 dmg_tmr_mob=0,
	 hit_spd_mob=0
}
	 state="menu"
end

function menu_animation()
	--player animation
 figures.tmr_plr+=0.2
 local dist=abs(figures.x_plr-figures.x_mob)
 
 if dist<10 and figures.fx_plr==true then
 	figures.is_plr_att=true
 	figures.sprt_plr=4+flr(figures.tmr_plr%2)
 	figures.dmg_tmr_mob=5
 	figures.hit_spd_mob=2.5
 else
  figures.is_attacking=false
  figures.sprt_plr=flr(figures.tmr_plr%2)
 end
 
	if figures.x_plr<80 and figures.fx_plr == false then
   figures.x_plr+=0.2
 else
   figures.fx_plr=true
   figures.x_plr-=0.4
 end
 
	-- mob movement
 if figures.dmg_tmr_mob>0 then
  figures.x_mob-=figures.hit_spd_mob
  figures.sprt_mob=49
  figures.dmg_tmr_mob-=1
 else
  figures.x_mob-=0.2
  figures.sprt_mob=48
 end
	
 figures.tmr_mob+=0.02
 figures.jmp_mob=abs(sin(figures.tmr_mob))*10
 
	if figures.x_plr<-16 and figures.x_mob<-16 then
  init_menu()
 end
 
end

function draw_menu()
	cls()
	map()
	--draw grass
	acc1=0
	for c=0,16 do
		sspr(8,32,8,8,acc1,88)
		acc1+=8
	end
	--draw flower
	acc2=0
	acc3=14
	for c=0,5 do
		sspr(24,32,8,8,acc2,88)
		acc2+=24
		sspr(16,32,8,8,acc3,88)
		acc3+=24
	end
	acc4=8
	for c=0,10 do
		sspr(24,32,4,4,acc4,88)
		acc4+=24
	end
	
	--player sprite
	spr(
		figures.sprt_plr,
		figures.x_plr,
		figures.y_plr,
		1,1,
		figures.fx_plr,
		figures.fy_plr
		)
	--mob sprite
	spr(
		figures.sprt_mob,
		figures.x_mob,
		figures.y_mob-figures.jmp_mob
		)
end
