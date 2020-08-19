Ts = 1/fs;
f1 = 2;
f2 = 6;
n = 0:2400;
t_n = n*Ts;
x=@(t) cos(2*pi*f1.*t).*(t>=0 & t<4)+ cos(2*pi*f0.*t).*(t>=4 & t<8)+ cos(2*pi*f2.*t).*(t>=8 & t<12);
x = x(t_n);
t_eff=@(R) (1/fs)*(log(0.01)/log(R));
fprintf(' R t_eff\n')
fprintf('--------------------\n')
fprintf('%6.3f %7.4f (sec)\n', R1, t_eff(R1))
fprintf('%6.3f %7.4f (sec)\n', R2, t_eff(R2))

figure
plot(t_n,x);
title('Input Signal');
axis([0 12 -2 2]);
ylabel('x(t)');
xlabel('t (sec)');
grid on;


figure
denom = x_1;
numer = G_1*y_1;
y_1 = tran(numer,denom,x);
plot(t_n,y_1);
title('Notch Filter Output, R = 0.980');
axis([0 12 -2 2]);
ylabel('y(t)');
xlabel('t (sec)');
grid on;


figure
denom = x_2; 
numer = G_2*y_2;
y_2 = tran(numer,denom,x);
plot(t_n,y_2);
title('Notch Filter Output, R = 0.995');
axis([0 12 -2 2]);
ylabel('y(t)');
xlabel('t (sec)');
grid on;

