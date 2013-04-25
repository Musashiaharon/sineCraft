fs = 48000;
len_t = 128;

vs = 34030

fprintf('Computing %g samples. fs is %g.\n', len_t, fs);
fprintf('Length is %g seconds or\n',len_t/fs);
fprintf('1/%g of a second.\n',fs/len_t);
fprintf('Distance traversed is %g centimeters.\n',len_t/fs*vs);

t = 0:len_t-1;

len_t = size(t,2);

A = [2^14, 2^14, 1.5*2^14, 2^13];
offset = [2^15, 2^15, 1.5*2^14, 2^15];
phase = [0,0,0,0];
f = [440, 3000, 6000, 4000];


s = zeros(2,len_t);

for i=1:2
    fprintf('\nComputing waveform %d:\n',i);
    fprintf('    f      = %g\n',    f(i));
    fprintf('    A      = %g\n',    A(i));
    fprintf('    phase  = %g\n',    phase(i));
    fprintf('    offset = %g\n',  offset(i));
    s(i,:) = round(A(i)*sin((t+phase(i)).*2*pi*f(i)/fs)+offset(i));
end

s=s';

dlmwrite('sines0.txt', dec2bin(s(:,1)),'delimiter','');
dlmwrite('sines1.txt', dec2bin(s(:,2)),'delimiter','');

fprintf('Saved to "sines0.txt" and "sines1.txt".\n');
fprintf('Plotting...\n');

plot(   t, s(:,1),'b-', ...
        t, s(:,2),'r-')%, ...
%        t, s(3,:),'g-', ...
%        t, s(4,:),'k-');

fprintf('[Done]\n\n');

