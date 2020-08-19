fresp = @(b,a,w) polyval(flip(b),exp(-j*w))./polyval(flip(a),exp(-j*w));
mag = @(b,a,w) abs(fresp(b,a,w));
R1 = 0.980;
R2 = 0.995;
f0 = 4;
fs = 200;
f = linspace(0,10,1001);
w = 2*pi*f/fs;
w0 = (2*pi*f0)/fs;


y_1 = [1 -2*cos(w0) 1];
x_1 = [1 -2*R1*cos(w0) R1^2];
G_1 = sum(x_1)/sum(y_1);
fprintf('filter 1\n')
fprintf('--------------------------------------\n')
fprintf('b = [ %8.6f %8.6f %8.6f ]\n', y_1)
fprintf('a = [ %8.6f %8.6f %8.6f ]\n', x_1)
fprintf('\n')
figure;
plot(f,G_1*mag(y_1,x_1,w))
title('Filter 1 - Magnitude Response (R = 0.980)');
axis([0 10 0 1.1]);
ylabel('|H(f)|')
xlabel('f (Hz)');
grid on;


y_2 = [1 -2*cos(w0) 1];
x_2 = [1 -2*R2*cos(w0) R2^2];
G_2 = sum(x_2)/sum(y_2);
fprintf('filter 2\n')
fprintf('--------------------------------------\n')
fprintf('b = [ %8.6f %8.6f %8.6f ]\n', y_2)
fprintf('a = [ %8.6f %8.6f %8.6f ]\n', x_2)
fprintf('\n')
figure;
plot(f,G_2*mag(y_2,x_2,w))
title('Filter 2 - Magnitude Response (R = 0.995)');
axis([0 10 0 1.1]);
ylabel('|H(f)|');
xlabel('f(Hz)');
grid on;