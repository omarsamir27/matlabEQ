function sketch_filter(b,a,bandNum)
    Band = strcat('Band',num2str(bandNum));
    if a == 1
        Band = strcat('FIR_',Band);
    else
        Band = strcat('IIR_',Band);
    end
    fig_freq=figure('Visible','off');
    freqz(b,a);
    grid on
    fig_resp=figure('Visible','off');
    [stp,t1] = stepz(b,a);
    [imp,t2] = impz(b,a);
    subplot(2,1,1)
    plot(t2,imp)
    grid on
    ylabel('impulse response');
    xlabel('time');
    subplot(2,1,2)
    plot(t1,stp)
    grid on
    ylabel('step response');
    xlabel('time');
    fig_pz=figure('Visible','off');
    zplane(b,a)
    grid on
    saveas(fig_freq,strcat(Band,'frequency_response.png'));
    saveas(fig_resp,strcat(Band,'imp_step_response.png'));
    saveas(fig_pz,strcat(Band,'pole_zero.png'));
    close all;
end
