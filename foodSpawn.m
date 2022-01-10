% randomise food coordinates
function [X,Y] = foodSpawn(sz)
    X = round((rand(1)*(sz/2-1) - (rand(1)*(sz/2-1))),0);
    Y = round((rand(1)*(sz/2-1) - (rand(1)*(sz/2-1))),0);
end