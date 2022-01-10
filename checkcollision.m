% checking for collision between player and enemy
function b = checkcollision(x1,y1,x2,y2)
    if abs(x1 - x2) <= 0.5 && abs(y1 - y2) <= 0.5
        b = 1;
    else
        b = 0;
    end
end