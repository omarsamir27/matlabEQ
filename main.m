clear
%%input
prompt = {'Path:','frequency sample:','Filter:(FIR=1),(IIR=2)','Gain:( 0- 170 Hz)',...
    'Gain:( 170- 310 Hz)','Gain:( 310- 600 Hz)','Gain:( 600- 1000 Hz)'...
    'Gain:( 1- 3 KHz)',' Gain:( 3- 6 KHz)','Gain: ( 6- 12 KHz)',' Gain:( 12-14 KHz)'...
    'Gain:( 14-16 KHz)',};
dlgtitle = 'Input';
dims = [1 100];
answer = inputdlg(prompt,dlgtitle,dims);
[data,fs] = audioread(char(answer(1)));
fs=str2double(answer(2));
gains = 1:9;
for i = 4:12
    gains(i-3)=str2double(answer(i));
end 
%%choose filter
if(str2double(answer(3))-1)
myeq = iirEQ(gains,data,fs);
else
myeq = iirEQ(gains,data,fs);
end
out = myeq.EqlzdAudio;
player = audioplayer(out,fs);
player.play
