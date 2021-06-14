classdef iirEQ
    properties
        %%Filter Coeffecients and gain[b,a]%%
        from0to170 
        from170to310 
        from310to600 
        from600to1K 
        from1Kto3K 
        from3Kto6K 
        from6Kto12K 
        from12Kto14K 
        from14kto16K 
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
            [b,a] = butter(obj.orders(1),170/fs);
            obj.from0to170 = {b,a};
            [b,a] = butter(obj.orders(2),[170 310]/fs);
            obj.from170to310 = {b,a};
            [b,a] = butter(obj.orders(3),[310 600]/fs);
            obj.from310to600 = {b,a};
            [b,a]= butter(obj.orders(4),[600 1000]/fs);
            obj.from600to1K = {b,a};
            [b,a] = butter(obj.orders(5),[1000 3000]/fs);
            obj.from1Kto3K = {b,a};
            [b,a] = butter(obj.orders(6),[3000 6000]/fs);
            obj.from3Kto6K = {b,a};
            [b,a] = butter(obj.orders(7),[6000 12000]/fs);
            obj.from6Kto12K = {b,a};
            [b,a] = butter(obj.orders(8),[12000 14000]/fs);
            obj.from12Kto14K = {b,a};
            [b,a] = butter(obj.orders(9),[14000 16000]/fs);
            obj.from14kto16K = {b,a};
            obj.EqlzdAudio = obj.eqaudio(audio);
        end
        function eqlzd = eqaudio(obj,audio)
            eqlzd = zeros(size(audio,1),size(audio,2));
            coeffecients = {obj.from0to170;...
                    obj.from170to310;...
                    obj.from310to600;...
                    obj.from600to1K;...
                    obj.from1Kto3K;...
                    obj.from3Kto6K;...
                    obj.from6Kto12K;...
                    obj.from12Kto14K;...
                    obj.from14kto16K};
            for i = 1:9
                currentcoeff = coeffecients{i};
                eqlzd = filter(obj.gains(i)*currentcoeff{1},currentcoeff{2},audio) + eqlzd;
            end            
        end
    end
end