function sketch_filter(b,a,bandNum)
    Band = concat('Band',num2str(bandNum));
    fig_freq=figure
    freqz(b,a)
    grid on
    fig_resp=figure
    [stp,t1] = stepz(b,a);
    [imp,t2] = impz(b,a);
    subplot(2,1,1)
    plot(imp,t2)
    grid on
    ylabel('impulse response');
    xlabel('time');
    subplot(2,1,2)
    plot(stp,t1)
    grid on
    ylabel('step response');
    xlabel('time');
    fig_pz=figure
    zplane(b,a)
    grid on
    saveas(fig_freq,concat(Band,'frequency_response.png'));
    saveas(fig_resp,concat(Band,'imp_step_response.png'));
    saveas(fig_pz,concat(Band,'pole_zero.png'));
end
