denom = x_1; 
numera = G_1*y_1;
Func = @(f) mag(numera,denom,2*pi*f/fs) - 1/sqrt(2);
d_fa = (fs/pi)*(1-R1);
Right = f0 + 0.5*d_fa;
Left = f0 - 0.5*d_fa;
Exact_L =fzero(Func,Left);
Exact_R =fzero(Func,Right);
percent_err = 100*((abs(Exact_L-Left)+abs(Exact_R-Right))/(abs(Exact_L)+abs(Exact_R)));
fprintf('     exact   approx\n')
fprintf('--------------------\n')
fprintf('fL = %6.4f %7.4f\n', Exact_L, Left)
fprintf('fR = %6.4f %7.4f\n', Exact_R, Right)
fprintf('-----------------------\n')
fprintf('percent error = %5.4f%s\n', percent_err, '%')
fprintf('\n')
f3dB_1 = [Exact_L , Exact_R];
w3dB_1 = [2*pi*Exact_L/fs, 2*pi*Exact_R/fs];
figure;
freq = [2 4 6];
wfreq = (2*pi/fs)*freq;
plot(f, G_1*mag(y_1,x_1,w))
hold on
plot(freq,G_1*mag(y_1,x_1,wfreq),'.','color','r','markersize',10)
plot(f3dB_1,G_1*mag(y_1,x_1,w3dB_1),'.-','color','g')
axis([0 10 0 1.1]);
grid;
ylabel('|H(f)|');
xlabel('f (Hz)');
title('Filter 1 - Magnitude Response (R = 0.980)');
legend('magnitude','f_{1},f_{0},f_{2}','3-dB width','location','southeast');




denom = x_2;
numera = G_2*y_2;
d_fa = (fs/pi)*(1-R2);
Left = f0 - 0.5*d_fa;
Right = f0 + 0.5*d_fa;
Func = @(f) mag(numera,denom,2*pi*f/fs) - 1/sqrt(2);
Exact_L =fzero(Func,Left);
Exact_R =fzero(Func,Right);
percent_err = 100*((abs(Exact_L-Left)+abs(Exact_R-Right))/(abs(Exact_L)+abs(Exact_R)));
fprintf('\n')
fprintf('     exact   approx\n')
fprintf('--------------------\n')
fprintf('fL = %6.4f %7.4f\n', Exact_L, Left)
fprintf('fR = %6.4f %7.4f\n', Exact_R, Right)
fprintf('-----------------------\n')
fprintf('percent error = %5.4f%s\n',percent_err,'%')
fprintf('\n')
f3dB_2 = [Exact_L,Exact_R];
w3dB_2 = [2*pi*Exact_L/fs, 2*pi*Exact_R/fs];
figure;
plot(f,G_2*mag(y_2,x_2,w))
hold on
plot(freq,G_2*mag(y_2,x_2,wfreq),'.','color','r','markersize',10)
plot(f3dB_2,G_2*mag(y_2,x_2,w3dB_2),'.-','color','g')
axis([0 10 0 1.1]); 
grid;
ylabel('|H(f)|');
xlabel('f (Hz)');
title('Filter 2 - Magnitude Response (R = 0.995)');
legend('magnitude','f_{1},f_{0},f_{2}','3-dB width','location','southeast');