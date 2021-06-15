function skt(sig1,sig2,fs,sig_name)
    sketch=figure;
    t=(0:size(sig1,1)-1)/fs;
    if(length(sig2)>1)
        title('Signal Comparison')
        subplot(2,2,1)
        plot(t,sig1,'k')
        grid on
        ylabel('signal1')
        xlabel('time')
        subplot(2,2,3)
        plot(t,sig2,'r')
        grid on
        ylabel('signal2')
        xlabel('time')
        [P1,f1] = periodogram(sig1,[],[],fs,'power');
        [P2,f2] = periodogram(sig2,[],[],fs,'power');
        subplot(2,2,2)
        plot(f1,P1,'k')
        grid on
        ylabel('signal1')
        xlabel('Frequency (Hz)')
        subplot(2,2,4)
        plot(f2,P2,'r')
        grid on
        ylabel('signal2')
        xlabel('Frequency (Hz)')
    else
        title('Signal ')
        subplot(2,2,[1 2])
        plot(t,sig1,'b')
        grid on
        ylabel('signal')
        xlabel('time')  
        [P1,f1] = periodogram(sig1,[],[],fs,'power');
        subplot(2,2,[3 4])
        plot(f1,P1,'b')
        grid on
        ylabel('signal')
        xlabel('Frequency (Hz)')
    end
    saveas(sketch,strcat(sig_name,'sketch_signal.png'));
    %close all;
end

