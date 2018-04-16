
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                        CO250-MINI PROJECT

%Performance analysis of state-of-the-art Digital-to-Analog Conversion
%techniques using Binary Amplitude Shift Keying (BASK) and Multi Amplitude
%Shift Keying 

%MEMBERS:
%1. PALAK SINGHAL  16CO129
%2. GOVIND JEEVAN  16CO221
%3. PRASANTH SAGAR 16CO225

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% BINARY AMPLITUDE SHIFT KEYING
function output=mask(x)
    global bp;
    global ss;
    global f;
    global Percentage;
    global A;
    global mn;
    global t4;
    bp=.000001;                                                    % bit period
    %disp(' Binary information at Trans mitter :');


    %XX representation of transmitting binary information as digital signal XXX
    bit = binary_to_digital(x);

%time period of the digital signal
    t1=bp/100:bp/100:100*length(x)*(bp/100);
%plotting the digital signal
    subplot(5,1,1);
    plot(t1,bit,'lineWidth',2.5);grid on;
    axis([ 0 bp*length(x) -.5 1.5]);
    ylabel('amplitude(volt)');
    xlabel(' time(sec)');
    title('transmitting information as digital signal');


%modulating the digital signal
    m=multi_modulator(A,x);

%plotting the modulated digital signal
    t3=bp/99:bp/99:bp*length(x)/log2(length(A));
    subplot(5,1,2);
    plot(t3,m);
    xlabel('time(sec)');
    ylabel('amplitude(volt)');
    title('waveform for binary ASK modulation coresponding binary information');
    
    
%creation of noisy signal
    [m,n] = noise_generator(10, m);

%plotting the noisy signal
    subplot(5,1,3);
    plot(t3,n);
    xlabel('time');
    ylabel('Noise Amplitude');
    title('Noise Signal');

%plotting the received noisy signal    
    subplot(5,1,4);
    plot(t3,m);
    xlabel('time');
    ylabel('amplitude');
    title('Received Signal');

%Demodulating the noisy received signal    
    mn=multi_demodulator(A, m);
    
    
    %XXXXX Representation of binary information as digital signal which achived 
    %after ASK demodulation XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
    bit = binary_to_digital(mn);

%plotting the demodulated signal as digital signal
    t4=bp/100:bp/100:100*length(mn)*(bp/100);
    subplot(5,1,5);
    plot(t4,bit,'LineWidth',2.5);grid on;
    axis([ 0 bp*length(mn) -.5 1.5]);
    ylabel('amplitude(volt)');
    xlabel(' time(sec)');
    title('received information as digital signal after binary ASK demodulation');

%calculating the percentage error in bits (BER)
    Percentage=[Percentage, sum(xor(mn,x))/length(x)*100];
end

