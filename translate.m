% matrix translation function
function nshape = translate(shape,a,b)
    % combine the 2 vectors into a 2-row matrix
    nshape = [shape(1,:) + a;shape(2,:) + b];
end