function [V] = dehomogeneisator(X)
V = [X(1)/X(3) X(2)/X(3)];
end