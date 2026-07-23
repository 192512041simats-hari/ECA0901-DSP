clc;
clear;
close all;

Fs = 10000;
Fp = 1000;
Fst = 1500;

[N,Wn] = buttord(Fp/(Fs/2),Fst/(Fs/2),1,60);
[b,a] = butter(N,Wn);

% Frequency Response
figure;
freqz(b,a);

% Impulse Response
[h,n] = impz(b,a,50);
figure;
stem(n,h,'filled');
grid on;
xlabel('Samples');
ylabel('Amplitude');
title('Impulse Response');

% Step Response
figure;
stepz(b,a);

% Pole-Zero Plot
figure;
zplane(b,a);

fprintf('Minimum Filter Order (N) = %d\n',N);
fprintf('Cutoff Frequency (Wn) = %.4f\n',Wn);