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
%                        MAIN FILE

clc;
close all;
global Percentage 
Percentage = [];


%Globally declaring all the variables used
global bp
global ss;
global f;
global t3;
global m;
global mn;
global t4;
global A;

%Amplitude matrix
A=[];

%Maxpower is the maximum power of two till which the no of amplitude levels can go
maxpower=3;

%Generating amplitude in power of two with values in multiples of 5
for i=1:maxpower
    for j=2:1:2^(i)+1
        A(j-1) =5*(j-1);
    end
    A
  
%Generating relevant messages corresponding to each amplitude matrix  
    maxlength=6;

%bitNumber function stuffs the message with 0's so as to make it relevant to the number of amplitude levels
    for l=1:2^maxlength   % ALL VALUES FROM 1 BIT TO maxlength BITS
    x = de2bi(l, 'left-msb');      % MESSAGE SIGNAL GENERATED
    x=bitNumber(x);
    mask(x);           % PERFORMING BINARY AMPLITUDE SHIFT KEYING
    end
    
     VarAmpPer=[VarAmpPer mean(Percentage)]
    mean(VarAmpPer)
end
%Plottting length of message vs percentage error detection based on no of bits transmitted correctly
len=1:length(VarAmpPer);
figure
plot(len, VarAmpPer) 


%len denotes the number of bits per signal element
%If the message generated is not a multiple of the length of the bits zeroes are appended to it 
function y=bitNumber(x)
    global A;
    len=log2(length(A));
    while mod(length(x),len) ~= 0
        x=[0 x];
    end
    y=x;
end

