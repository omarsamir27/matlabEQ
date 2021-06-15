classdef firEQ
    properties
        coeffecients = {} %filter coefficeints 'b'%
        bands = {170,[170 310],[310 600],[600 1000],[1000 3000],[3000 6000],[6000 12000],[12000 14000],[14000 16000]} %band for every filter%
        gains %gains input from user
        orders = [200,200,150,120,120,120,50,30,30] %order for every filter,obtained experimently 
        EqlzdAudio %ouput audio after filtering incl. gains
    end
    methods
        function obj = firEQ(gains,audio,fs)
            obj.gains = gains;
            fn = fs/2;
            for i = 1:9
                obj.coeffecients{i} = fir1(obj.orders(i),obj.bands{i} / fn); %%FIR with Hamming Window
                sketch_filter(obj.coeffecients{i},1,i); %sketch and analysis of each filter
            end
            obj.EqlzdAudio = obj.eqaudio(audio,fs); %equalize the audio
            skt(obj.EqlzdAudio,audio,fs,'CompositeVSOriginl'); %compare original and composite signals
        end
        function eqlzd = eqaudio(obj,audio,fs)
            eqlzd = zeros(size(audio,1),size(audio,2));
            for i = 1:9
                currentcoeff = obj.coeffecients{i};
                filtered_part = filter(obj.gains(i)*currentcoeff,1,audio); %filter target band
                skt(filtered_part,[],fs,strcat('Band',num2str(i))); %sketch this band
                eqlzd = filtered_part + eqlzd; %compose signal from filtered
            end            
        end
    end
end