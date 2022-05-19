%part 8
fileName="C:/Users/Emz/Downloads/drumloop.wav";
[drumloop,Fs]=audioread(fileName);
len=length(drumloop)
t=(0:len-1)./Fs;
figure(1)
plot(t,drumloop)
xlabel('Time (Sec)'), ylabel('Amplitude'),title('Drumloop')
audiowrite('drumloop.wav', drumloop, Fs)
if (playSoundFlag==1)
soundsc(drumloop,Fs)
endif

figure(2)
FFTlength=256;win=hanning(FFTlength);hopSize=FFTlength/2;
subplot(2,1,1), specgram(drumloop,FFTlength,Fs,win,hopSize);colormap jet
title('Spectrogram of drumloop N=256')
FFTlength=2048;win=hanning(FFTlength);hopSize=FFTlength/2;
subplot(2,1,2), specgram(drumloop,FFTlength,Fs,win,hopSize);colormap jet
title('Spectrogram of drumloop, N=2048')

