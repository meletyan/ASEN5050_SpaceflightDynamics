function xdot = TWOBODY(t, x)
Mu   = 3.986004415e5;
r    = norm(x(1:3));
xdot = [x(4); x(5); x(6); -Mu*x(1)/r^3; -Mu*x(2)/r^3; -Mu*x(3)/r^3];


end

