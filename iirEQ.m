classdef iirEQ
    properties
        coeffecients = {} %filter coefficeints 'b,a'%
        bands = {170,[170 310],[310 600],[600 1000],[1000 3000],[3000 6000],[6000 12000],[12000 14000],[14000 16000]} %band for every filter%
        gains %gains input from user
        orders = [8,4,5,5,8,6,8,7,8] %order for every filter,obtained experimently
        EqlzdAudio %ouput audio after filtering incl. gains
    end
    methods
        function obj = iirEQ(gains,audio,fs)
            obj.gains = gains;
            for i = 1:9
                [b,a] = butter(obj.orders(i),obj.bands{i} / (fs/2)); %%Butterworth Approxiamtion IIR
                sketch_filter(b,a,i);  %sketch and analysis of each filter
                obj.coeffecients{i} = {b,a};
            end
            obj.EqlzdAudio = obj.eqaudio(audio,fs); %equalize the audio
            skt(obj.EqlzdAudio,audio,fs,'CompositeVSOriginl'); %compare original and composite signals
        end
        function eqlzd = eqaudio(obj,audio,fs)
            eqlzd = zeros(size(audio,1),size(audio,2));
            for i = 1:9
                currentcoeff = obj.coeffecients{i};
                filtered_part = filter(obj.gains(i)*currentcoeff{1},currentcoeff{2},audio);  %filter target band
                skt(filtered_part,[],fs,strcat('Band',num2str(i))); %sketch this band
                eqlzd = filtered_part + eqlzd; %compose signal from filtered
            end            
        end
    end
end