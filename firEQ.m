classdef firEQ
    properties
        %%b%%
        from0to170 
        from170to310 
        from310to600 
        from600to1K 
        from1Kto3K 
        from3Kto6K 
        from6Kto12K 
        from12Kto14K 
        from14kto16K 
        %%Gain%%
        gains
        %%Order%%
        orders = [1,1,1,1,1,1,1,1,1]
        %%Audio After Filtering
        EqlzdAudio
    end
    methods
        function obj = firEQ(gains,audio,fs)
            obj.gains = gains;
            fn = fs/2;
            obj.from0to170 = fir1(obj.orders(1),170/fn);
            obj.from170to310 = fir1(obj.orders(2),[170 310]/fn, 'bandpass');
            obj.from310to600 = fir1(obj.orders(3),[310 600]/fn, 'bandpass');
            obj.from600to1K = fir1(obj.orders(4),[600 1000]/fn, 'bandpass');
            obj.from1Kto3K = fir1(obj.orders(5),[1000 3000]/fn, 'bandpass');
            obj.from3Kto6K = fir1(obj.orders(6),[3000 6000]/fn, 'bandpass');
            obj.from6Kto12K = fir1(obj.orders(7),[6000 12000]/fn, 'bandpass');
            obj.from12Kto14K = fir1(obj.orders(8),[12000 14000]/fn, 'bandpass');
            obj.from14kto16K = fir1(obj.orders(9),[14000 16000]/fn, 'bandpass');
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
                eqlzd = filter(obj.gains(i)*currentcoeff,currentcoeff,audio) + eqlzd;
            end            
        end
    end
end