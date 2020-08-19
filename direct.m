function y = direct(b,a,x);
    a1 = a(1);
    a2 = a(2);
    a3 = a(3);
    b1 = b(1);
    b2 = b(2);
    b3 = b(3);
    y(1) = b1*x(1);
    y(2) = b1*x(2)+b2*x(1)-a2*y(1);
    n = length(x);
    for i=3:n;
        y(i) = b1*x(i)+b2*x(i-1)+b3*x(i-2)-a2*y(i-1)-a3*y(i-2);
    end
end