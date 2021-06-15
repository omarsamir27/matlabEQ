clear
%%input
[file,path] = uigetfile('*.*','Select Audio File for Equalizer'); %get file
[data,fs] = audioread(fullfile(path,file)); %get audio
prompt = {'Input Frequency Sample:','Filter:(FIR=1),(IIR=2)','Gain:( 0- 170 Hz) * All gains in dB',...
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
gains = db2mag(gains); %convert decibel gain to value%
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
player = audioplayer(out,fs); %to play audio from command window
%write filtered output at original,double and half Frequency Sampling Rate%
audiowrite(strcat('originalFS_',num2str(fs),file),out,fs);
audiowrite(strcat('halfFS_',num2str(fs/2),file),out,fs/2);
audiowrite(strcat('doubleFS_',num2str(2*fs),file),out,2*fs);

