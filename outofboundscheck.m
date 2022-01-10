% check for out of bounds
function b = outofboundscheck(x,y,sz)
    if x > sz/2 || x < -sz/2
        b = 1;
    elseif y > sz/2 || y < -sz/2
        b = 1;
    else
        b = 0;
    end
end     