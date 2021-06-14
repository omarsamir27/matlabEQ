function skt(sig1,sig2,fs)
sketch=figure
t=(0:numel(sig1)-1)/fs;
if(length(sig2)>1)
title('Signal Comparison')
subplot(4,1,1)
plot(t,sig1,'k')
grid on
ylabel('signal1')
xlabel('time')
subplot(4,1,2)
plot(t,sig2,'r')
grid on
ylabel('signal2')
xlabel('time')
[P1,f1] = periodogram(sig1,[],[],fs,'power');
[P2,f2] = periodogram(sig2,[],[],fs,'power');
subplot(4,2,1)
plot(f1,P1,'k')
grid on
ylabel('signal1')
xlabel('Frequency (Hz)')
axis tight   
subplot(4,2,2)
plot(f2,P2,'r')
grid on
ylabel('signal2')
xlabel('Frequency (Hz)')
axis tight   
else
title('Signal ')
subplot(4,1,1)
plot(t,sig1,'k')
grid on
ylabel('signal')
xlabel('time')  
[P1,f1] = periodogram(sig1,[],[],fs,'power');
plot(f1,P1,'k')
grid on
ylabel('signal')
xlabel('Frequency (Hz)')
end
saveas(sketch,'sketch_signal.png');
end

