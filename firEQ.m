classdef firEQ
    properties
        coeffecients = {}
        bands = {170,[170 310],[310 600],[600 1000],[1000 3000],[3000 6000],[6000 12000],[12000 14000],[14000 16000]}
        gains
        orders = [200,200,120,120,120,120,50,30,30]
        EqlzdAudio
    end
    methods
        function obj = firEQ(gains,audio,fs)
            obj.gains = gains;
            fn = fs/2;
            for i = 1:9
                obj.coeffecients{i} = fir1(obj.orders(i),obj.bands{i} / fn);
                sketch_filter(obj.coeffecients{i},1,i);
            end
            obj.EqlzdAudio = obj.eqaudio(audio);
            skt(obj.EqlzdAudio,audio,fs,'CompositeVSOriginl');
        end
        function eqlzd = eqaudio(obj,audio)
            eqlzd = zeros(size(audio,1),size(audio,2));
            for i = 1:9
                currentcoeff = obj.coeffecients{i};
                filtered_part = filter(obj.gains(i)*currentcoeff,1,audio);
                skt(filtered_part,[],fs,strcat('Band',num2str(i)));
                eqlzd = filtered_part + eqlzd;
            end            
        end
    end
end