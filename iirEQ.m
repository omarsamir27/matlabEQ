classdef iirEQ
    properties
        %%Filter Coeffecients and gain[b,a]%%
        coeffecients = {}
        bands = {170,[170 310],[310 600],[600 1000],[1000 3000],[3000 6000],[6000 12000],[12000 14000],[14000 16000]}
        %%Gains Array,same ordering as filter coeffecients%%
        gains
        %%Order Array for filters%%
        orders = [8,4,5,5,8,6,8,7,8]
        %%Audio After Filtering
        EqlzdAudio
    end
    methods
        function obj = iirEQ(gains,audio,fs)
            obj.gains = gains;
            fs = fs/2;
            for i = 1:9
                [b,a] = butter(obj.orders(i),obj.bands{i} / fs);
                obj.coeffecients{i} = {b,a};
            end
            obj.EqlzdAudio = obj.eqaudio(audio);
        end
        function eqlzd = eqaudio(obj,audio)
            eqlzd = zeros(size(audio,1),size(audio,2));
            for i = 1:9
                currentcoeff = obj.coeffecients{i};
                eqlzd = filter(obj.gains(i)*currentcoeff{1},currentcoeff{2},audio) + eqlzd;
            end            
        end
    end
end