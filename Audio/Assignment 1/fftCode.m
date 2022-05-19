close all;
playSoundFlag=0;
Fs=11025; #set the sampling frequency
fhz=1110; #set the frequency in Hertz
tdur=1;  #set the time duration in seconds
Amplitude=1; #amplitude of the wave
phase=0; #Phase shift in radians;

%Generating multiple sinewaves in Octave
Fs=44100; %set the sampling frequency

tdur=1; %set the time duration in seconds
phaseShiftVect=[]
AmplitudeVect=[]
fhzVect =[]
i=1
while i <=10
  fhzVect=[fhzVect; ((i*2))*100]
  AmplitudeVect=[AmplitudeVect; 1/((i*2))]
  phaseShiftVect=[phaseShiftVect; 0]
  i=i+1
 endwhile

[output2,t]=Gen_MultiSine(AmplitudeVect,fhzVect,Fs,tdur,phaseShiftVect);
figure(1)
plot(t(1:1000),output2(1:1000))
xlabel('Time (Sec)'), ylabel('Amplitude'),title('Signal of multiple sinusoid waves'), axis tight
if (playSoundFlag==1)
soundsc(output2,Fs)
endif

FFTlength=256;
sigLen=2000;
win=hanning(sigLen)';
winSig=output2(1:sigLen).*win;
FxLen1win=fft(winSig,FFTlength);
Magnitude=abs(FxLen1win);
MagnitudedB=20.*log10(Magnitude);

faxis=0:Fs./FFTlength:Fs-Fs./FFTlength;
figure(7),
plot(faxis(1:FFTlength/2),MagnitudedB(1:FFTlength/2)), axis tight
xlabel('Frequency (Hertz)'), ylabel('Magnitude (dB)'),title('Magnitude of Frequency Spectrum of Sinewave with N=256, Hanning window')

FFTlength=2048;
sigLen=2000;
win=hanning(sigLen)';
winSig=output2(1:sigLen).*win;
FxLen1win=fft(winSig,FFTlength);
Magnitude=abs(FxLen1win);
MagnitudedB=20.*log10(Magnitude);

faxis=0:Fs./FFTlength:Fs-Fs./FFTlength;
figure(8),
plot(faxis(1:FFTlength/2),MagnitudedB(1:FFTlength/2)), axis tight
xlabel('Frequency (Hertz)'), ylabel('Magnitude (dB)'),title('Magnitude of Frequency Spectrum of Sinewave with N=2048, Hanning window')

fileName="C:/Users/Emz/Downloads/A.wav";
[vowel,Fs]=audioread(fileName);
len=length(vowel)
t=(0:len-1)./Fs;
figure(3)
plot(t,vowel)
xlabel('Time (Sec)'), ylabel('Amplitude'),title('Water sound effect')
audiowrite('Vowel.wav', vowel, Fs)
if (playSoundFlag==1)
soundsc(vowel,Fs)
endif

FFTlength=256;
sigLen=1000;
win=hanning(sigLen)';
winSig=vowel(1:sigLen).*win;
FxLen1win=fft(winSig,FFTlength);
Magnitude=abs(FxLen1win);
MagnitudedB=20.*log10(Magnitude);

faxis=0:Fs./FFTlength:Fs-Fs./FFTlength;
figure(9),
subplot(1,1,1),plot(faxis(1:FFTlength/2),MagnitudedB(1:FFTlength/2)), axis([0 5000 -20 40])
xlabel('Frequency (Hertz)'), ylabel('Magnitude (dB)'),title('FFT On Vowel Sound with N=256')


fileName="C:/Users/Emz/Downloads/clinton.wav";
[clinton,Fs]=audioread(fileName);
len=length(clinton)
t=(0:len-1)./Fs;
figure(3)
plot(t,clinton)
xlabel('Time (Sec)'), ylabel('Amplitude'),title('Bill Clinton: I did not lie, these alegations are false')
audiowrite('clinton.wav', clinton, Fs)
if (playSoundFlag==1)
soundsc(clinton,Fs)
endif
