function [y vout] = tran(b,a,x,vin);
    a1 = a(1);
    a2 = a(2);
    a3 = a(3);
    b1 = b(1);
    b2 = b(2);
    b3 = b(3);
    if nargin < 4;
        vin = [0,0];
    end
    v_1(1) = vin(1);
    v_2(1) = vin(2);
    N = length(x);
    for i=1:N;
        y(i) = b1*x(i)+v_1(i);
        v_1(i+1) = b2*x(i)-a2*y(i)+v_2(i);
        v_2(i+1) = b3*x(i)-a3*y(i);
    end
vout = [v_1(N+1) v_2(N+1)];