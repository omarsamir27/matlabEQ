clear
%%input
[file,path] = uigetfile('','Select Audio File for Equalizer');
[data,fs] = audioread(fullfile(path,file));
prompt = {'Frequency Sample:','Filter:(FIR=1),(IIR=2)','Gain:( 0- 170 Hz) * All gains in dB',...
    'Gain:( 170- 310 Hz)','Gain:( 310- 600 Hz)','Gain:( 600- 1000 Hz)'...
    'Gain:( 1- 3 KHz)',' Gain:( 3- 6 KHz)','Gain: ( 6- 12 KHz)',' Gain:( 12-14 KHz)'...
    'Gain:( 14-16 KHz)'};
default_values = {num2str(fs),'','0','0','0','0','0','0','0','0','0'};
answer = inputdlg(prompt,'Input',[1 50],default_values);
fs=str2double(answer(1));
gains = zeros(1,9);
for i = 1:9
    gains(i)=str2double(answer(i+2));
end 
gains = db2mag(gains);
%%choose filter
if(str2double(answer(2))==1)
    myeq = firEQ(gains,data,fs);
elseif(str2double(answer(2))==2)
    myeq = iirEQ(gains,data,fs);
else
    msgbox('THIS OPTION IS NOT AVAILABLE!');
    exit
end
out = myeq.EqlzdAudio;
player = audioplayer(out,fs);
player.play
