function change_scenes(plr)
    --village to forest
    if scene=="village" and plr.x > 128 then
        scene="forest"
        current_map.x = 32
        
    -- forest back to village
    elseif scene=="forest" and plr.x < 128 then
        scene="village"
        current_map.x = 16
    end
end