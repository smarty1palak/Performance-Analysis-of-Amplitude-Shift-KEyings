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

%                          Multilevel-ASK modulation 

function m = binary_modulator(A,x)
% A is the matrix of amplitudes
% x Message signal

global bp;
global ss;
global f;
br=1/bp;                                                         % bit rate
f=br*10;                                                 % carrier frequency 
t2=bp/99:bp/99:bp;                                       % time period to transmit one bit of information
ss=length(t2);                                           %length of time period
m=[];                                                    %matrix to store the modulated signal


%No of amplitude levels
levels=length(A);

%No of bits per signal element
signalbits=log2(levels);


%a loop is made which increments the elements in the message by no of signalbits until the length of the message
for (i=1:signalbits:length(x))
    
    %each unit comprising of signalbits is stored in a matrix called bits
    bits=x(i:i+signalbits-1);

    %it's converted to its decimal value
    bits=bi2de(bits,'left-msb');

    %signal is modulated by using the bits value as the index of amplitude matrix
    y=A(bits+1)*cos(2*pi*f*t2);  

%resulting signal after modulation
    m=[m y];
    
end


end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

