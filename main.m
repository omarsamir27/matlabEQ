clear
[data,fs] = audioread("C:\Users\omars\Desktop\EQ\matlabEQ\04. Mahragan.flac");
gains = [1,1,1,1,1,1,1,1,1];
myeq = iirEQ(gains,data,fs);
out = myeq.EqlzdAudio;
player = audioplayer(out,fs);
player.play