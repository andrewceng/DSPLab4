vin = [0 0];
N = length(x);
fprintf(' n    x    y           v1          v2\n')
fprintf('-------------------------------------------\n')
for n=1:N
 [y, vout] = tran(num,denom,x(n),vin);
 fprintf('%2i %4i %11.6f %11.6f %11.6f\n', n-1, x(n), y, vin(1),vin(2))
 vin = vout;
end
fprintf(' 8    -    -          -2.879575   -2.485510\n')
fprintf('\n')
