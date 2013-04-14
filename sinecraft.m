t = 0:1023;

len_t = size(t,2);

fs = 192000;

A = [2^15, 2^14, 1.5*2^14, 2^13];
offset = [2^15, 2^15, 1.5*2^14, 2^15];
phase = zeros(4,1);
f = [1000, 3000, 6000, 4000];


s = zeros(1,len_t);

for i=1:1
s(i,:) = round(A(i)*sin((t+phase(i)).*f(i)/fs)+offset(i));
end

dlmwrite('sines.txt', s');

%plot(   t, s(1,:),'b-', ...
%        t, s(2,:),'r-', ...
%        t, s(3,:),'g-', ...
%        t, s(4,:),'k-');

