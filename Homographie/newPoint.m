function [ x, y ] = newPoint(D, boxsize, x, y )
    [xCenter, yCenter] = predictionCentre(x(1), y(1), x(2), y(2));
    % Copie de N-1 vers N-2
    x = [x(1), x(1)];
    y = [y(1), y(1)];
    [x(1),y(1)] = maxlocal(D, xCenter, yCenter, boxsize);
end

