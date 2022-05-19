#Play G4 Sinewave
playSoundFlag=1; %change this value to 1 to hear the sound for each wav file
Fs=44100; #set the sampling frequency
fhz=392.00; #set the frequency in Hertz
tdur=1;  #set the time duration in seconds
Amplitude=1; #amplitude of the wave
phase=pi; #Phase shift in radians;
filename = '392hz.wav';
%generate a single sinewave
[output1s,t]=Gen_sine(Amplitude,fhz,Fs,tdur,phase);
figure(1)
subplot(2,1,1),plot(t(1:1000),output1s(1:1000)), axis tight
xlabel('Time (Sec)'), ylabel('Amplitude'),title('G4 392Hz Wave ')
if (playSoundFlag==1)
soundsc(output1s,Fs)
audiowrite (filename, output1s, Fs)
endif

%Generating multiple sinewaves in Octave
Fs=44100; %set the sampling frequency

tdur=1; %set the time duration in seconds
phaseShiftVect=[]
AmplitudeVect=[]
fhzVect =[]
i=1
while i <=500
  fhzVect=[fhzVect; ((i*2)-1)*100]
  AmplitudeVect=[AmplitudeVect; 1/((i*2)-1)]
  phaseShiftVect=[phaseShiftVect; 0]
  i=i+1
 endwhile

[output2,t]=Gen_MultiSine(AmplitudeVect,fhzVect,Fs,tdur,phaseShiftVect);
figure(2)
plot(t(1:1000),output2(1:1000))
xlabel('Time (Sec)'), ylabel('Amplitude'),title('Squarewave composed of 500 harmonic sinusoid waves'), axis tight
if (playSoundFlag==1)
soundsc(output2,Fs)
audiowrite ('Squarewave.wav', output2, Fs)
endif

fileName="C:/Users/Emz/Downloads/Ocean.wav";
[ocean,Fs]=audioread(fileName);
len=20*Fs
t=(0:len-1)./Fs;
figure(3)
cutdown = ocean(1:len, 1:2)
plot(t,cutdown)
xlabel('Time (Sec)'), ylabel('Amplitude'),title('Water sound effect')
audiowrite('Ocean.wav', cutdown, Fs)
if (playSoundFlag==1)
soundsc(cutdown,Fs)
endif
