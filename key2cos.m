function [xx,tt] = key2cos(keynum, amp, phase, fsamp, dur )
tt = 0:(1/fsamp):dur;
delta = keynum-49;
freqKey = 440*pow2(delta/12); %Using A4 key as reference
Xphasor = amp*exp(j*phase);
xx = real( Xphasor*exp(j*2*pi*freqKey*tt) );
%plot(tt,xx)
